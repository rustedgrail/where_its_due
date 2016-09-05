defmodule WhereItsDue.Foo do
  alias WhereItsDue.Repo
  alias WhereItsDue.Person
  alias WhereItsDue.Role

  use HTTPoison.Base

  require IEx

  def read_all_files do
    Path.wildcard("game-*.json")
    |> Enum.each(&read_a_file/1)
  end

  def read_a_file path do
    {:ok, game_data} = File.read path
    {:ok, game_json} = Poison.decode(game_data)

    people = game_json["people"]

    if (people) do
      Enum.each(people, fn (json) -> create_a_person(json, game_json["id"]) end)
    end
  end

  def create_a_person person_json, game_id do
    changeset = Person.changeset(%Person{}, %{
      name: person_json["name"],
      giant_bomb_id: person_json["id"]
    })

    if changeset.valid? do
      {:ok, person} = Repo.insert changeset
      IO.puts "Person #{person.id}"
      Repo.insert! Role.changeset(%Role{}, %{
        game_id: game_id,
        person_id: person.id,
        role: "White Wizard"
      })
    end
  end
end

WhereItsDue.Foo.read_all_files

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WhereItsDue.Repo.insert!(%WhereItsDue.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule WhereItsDue.DatabaseSeeder do
  alias WhereItsDue.Repo
  alias WhereItsDue.Game
  alias WhereItsDue.Platform
  alias WhereItsDue.Company
  use HTTPoison.Base

  @base_url "http://www.giantbomb.com/api/"
  @giant_bomb Application.get_env :where_its_due, WhereItsDue.GiantBomb

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  # TODO: aliases, platforms, images, get all games
  def get_games do
    [key: key] = @giant_bomb
    get!("#{@base_url}games/?format=json&api_key=#{key}").body["results"]
    |> Enum.each(fn(struct) ->
      Game.changeset(%Game{}, %{
        name: struct["name"],
        description: struct["description"],
        giant_bomb_id: struct["id"],
        image: [struct["image"]["screen_url"] | [struct["image"]["icon_url"]]],
        deck: struct["deck"]
      })
      |> Repo.insert!
    end)
  end

  def get_platforms(offset \\ 0) do
    [key: key] = @giant_bomb
    response = get!("#{@base_url}platforms/?format=json&offset=#{offset}&api_key=#{key}").body
    results_remaining = response["number_of_total_results"] - offset - 100

    if results_remaining  > 0 do
      get_platforms(offset + 100)
    end

    changeset = response["results"]
    |> Enum.each(fn(struct) -> get_company struct["company"]["id"] end)
    |> Enum.each(fn(struct) ->
      Platform.changeset(%Platform{}, %{
        name: struct["name"],
        description: struct["description"],
        giant_bomb_id: struct["id"],
        deck: struct["deck"],
        company_id: struct["company"]["id"],
        abbreviation: struct["abbreviation"]
      })
    end)

    IO.puts changeset
    if changeset.valid? do
      Repo.insert! changeset
    end
  end

  def get_company company_id do
    case Repo.get_by(Company, %{giant_bomb_id: company_id}) do
      nil ->
        [key: key] = @giant_bomb
        url = "#{@base_url}company/#{company_id}/?format=json&api_key=#{key}"

        company = get!(url).body["results"]
        Company.changeset(%Company{}, %{
          name: company["name"],
          description: company["description"],
          giant_bomb_id: company["id"],
          deck: company["deck"],
          abbreviation: company["abbreviation"]
        })
        |> Repo.insert!
      _ -> ()
    end
  end

  def clear do
    Repo.delete_all
  end
end

# WhereItsDue.DatabaseSeeder.get_games
WhereItsDue.DatabaseSeeder.get_platforms

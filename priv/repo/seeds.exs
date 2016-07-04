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
  use HTTPoison.Base

  @base_url "http://www.giantbomb.com/api/"

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  def get_games do
    [key: key] = Application.get_env :where_its_due, WhereItsDue.GiantBomb
    get!("#{@base_url}games/?format=json&limit=1&api_key=#{key}").body["results"]
    |> IO.puts
  end

  def clear do
    Repo.delete_all
  end
end

WhereItsDue.DatabaseSeeder.get_games

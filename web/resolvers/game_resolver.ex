defmodule WhereItsDue.GameResolver do
  alias WhereItsDue.Game
  alias Neo4j.Sips, as: Neo4j

  import Ecto.Query

  @neo4j_conf Application.get_env :where_its_due, WhereItsDue.Neo4j

  def all(_args, _info) do
    {:ok, WhereItsDue.Repo.all(from g in Game, preload: [:roles, :people])}
  end

  def graph(%{"id": id, "distance": distance}, _info) do
    initial = "MATCH (game {game_id: '#{id}'})"

    query_with_edges = Enum.reduce(1..distance, initial, fn(x, acc) ->
      acc <> "-[]-(dev#{x})"
    end)

    return_query = (
      [" RETURN game.name"] ++
      Enum.map(1..distance, fn(x) -> "dev#{x}.name" end)
    ) |> Enum.join(", ")

    full_query = query_with_edges <> return_query

    [url: url] = @neo4j_conf
    Neo4j.start_link(url: url)
    {:ok, results} = Neo4j.query(Neo4j.conn, full_query)

    {:ok, Enum.map(results, fn(x) -> %{name: x["dev1.name"]} end)}
  end
end

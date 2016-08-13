defmodule WhereItsDue.GameView do
  use WhereItsDue.Web, :view

  def render("index.json", %{games: games}) do
    %{data: render_many(games, WhereItsDue.GameView, "game.json")}
  end

  def render("game.json", %{game: game}) do
    %{
      id: game.id,
      name: game.name,
      deck: game.deck,
      description: game.description,
      giantBombId: game.giant_bomb_id
    }
  end
end

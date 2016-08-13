defmodule WhereItsDue.GameController do
  use WhereItsDue.Web, :controller

  alias WhereItsDue.Game

  plug :action

  def index(conn, _params) do
    games = Repo.all(Game)
    render conn, "index.json", games: games
  end
end

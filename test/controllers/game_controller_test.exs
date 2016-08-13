defmodule WhereItsDue.GameControllerTest do
  use WhereItsDue.ConnCase

  alias WhereItsDue.Game

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end
  
  test "lists all entries on index", %{conn: conn} do
    conn = get conn, game_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

end

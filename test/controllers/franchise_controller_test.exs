defmodule WhereItsDue.FranchiseControllerTest do
  use WhereItsDue.ConnCase

  alias WhereItsDue.Franchise
  @valid_attrs %{deck: "some content", description: "some content", giant_bomb_id: 42, name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, franchise_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    franchise = Repo.insert! %Franchise{}
    conn = get conn, franchise_path(conn, :show, franchise)
    assert json_response(conn, 200)["data"] == %{"id" => franchise.id,
      "name" => franchise.name,
      "deck" => franchise.deck,
      "description" => franchise.description,
      "giant_bomb_id" => franchise.giant_bomb_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, franchise_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, franchise_path(conn, :create), franchise: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Franchise, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, franchise_path(conn, :create), franchise: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    franchise = Repo.insert! %Franchise{}
    conn = put conn, franchise_path(conn, :update, franchise), franchise: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Franchise, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    franchise = Repo.insert! %Franchise{}
    conn = put conn, franchise_path(conn, :update, franchise), franchise: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    franchise = Repo.insert! %Franchise{}
    conn = delete conn, franchise_path(conn, :delete, franchise)
    assert response(conn, 204)
    refute Repo.get(Franchise, franchise.id)
  end
end

defmodule WhereItsDue.GameTest do
  use WhereItsDue.ModelCase

  alias WhereItsDue.Game

  @valid_attrs %{aliases: [], deck: "some content", description: "some content", giant_bomb_id: 42, image: [], name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Game.changeset(%Game{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Game.changeset(%Game{}, @invalid_attrs)
    refute changeset.valid?
  end
end

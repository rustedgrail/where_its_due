defmodule WhereItsDue.FranchiseTest do
  use WhereItsDue.ModelCase

  alias WhereItsDue.Franchise

  @valid_attrs %{deck: "some content", description: "some content", giant_bomb_id: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Franchise.changeset(%Franchise{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Franchise.changeset(%Franchise{}, @invalid_attrs)
    refute changeset.valid?
  end
end

defmodule WhereItsDue.CompanyTest do
  use WhereItsDue.ModelCase

  alias WhereItsDue.Company

  @valid_attrs %{abbreviation: "some content", aliases: [], deck: "some content", description: "some content", giant_bomb_id: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Company.changeset(%Company{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Company.changeset(%Company{}, @invalid_attrs)
    refute changeset.valid?
  end
end

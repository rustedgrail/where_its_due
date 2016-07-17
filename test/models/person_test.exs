defmodule WhereItsDue.PersonTest do
  use WhereItsDue.ModelCase

  alias WhereItsDue.Person

  @valid_attrs %{aliases: [], deck: "some content", description: "some content", gender: "some content", giant_bomb_id: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Person.changeset(%Person{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Person.changeset(%Person{}, @invalid_attrs)
    refute changeset.valid?
  end
end

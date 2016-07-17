defmodule WhereItsDue.PlatformTest do
  use WhereItsDue.ModelCase

  alias WhereItsDue.Platform

  @valid_attrs %{abbreviation: "some content", deck: "some content", description: "some content", giant_bomb_id: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Platform.changeset(%Platform{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Platform.changeset(%Platform{}, @invalid_attrs)
    refute changeset.valid?
  end
end

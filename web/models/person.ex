defmodule WhereItsDue.Person do
  use WhereItsDue.Web, :model

  schema "people" do
    field :aliases, {:array, :string}
    field :deck, :string
    field :description, :string
    field :gender, :string
    field :giant_bomb_id, :integer
    field :name, :string

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w(aliases deck description gender giant_bomb_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

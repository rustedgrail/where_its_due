defmodule WhereItsDue.Company do
  use WhereItsDue.Web, :model

  schema "companies" do
    field :abbreviation, :string
    field :aliases, {:array, :string}
    field :deck, :string
    field :description, :string
    field :giant_bomb_id, :integer
    field :name, :string

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w(abbreviation aliases deck description giant_bomb_id)

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

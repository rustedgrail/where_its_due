defmodule WhereItsDue.Game do
  use WhereItsDue.Web, :model

  schema "games" do
    field :name, :string
    field :description, :string
    field :giant_bomb_id, :integer
    field :image, {:array, :string}
    field :aliases, {:array, :string}
    field :deck, :string

    has_many :roles, WhereItsDue.Role
    has_many :people, through: [:roles, :game]
    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w(giant_bomb_id image aliases description deck)

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

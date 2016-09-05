defmodule WhereItsDue.Role do
  use WhereItsDue.Web, :model

  schema "roles" do
    field :role, :string
    belongs_to :person, WhereItsDue.Person
    belongs_to :game, WhereItsDue.Game

    timestamps
  end

  @required_fields ~w(role person_id game_id)
  @optional_fields ~w()

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

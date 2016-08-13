defmodule WhereItsDue.Schema.Types do
  use Absinthe.Schema.Notation

  object :game do
    field :id, :id
    field :name, :string
    field :description, :string
    field :deck, :string
    field :giant_bomb_id, :integer
  end
end

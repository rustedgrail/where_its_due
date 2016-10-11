defmodule WhereItsDue.Schema.Types do
  use Absinthe.Schema.Notation

  object :game do
    field :id, :id
    field :name, :string
    field :description, :string
    field :deck, :string
    field :giant_bomb_id, :integer
    field :roles, list_of(:role)
    field :people, list_of(:person)
  end

  object :role do
    field :id, :id
    field :person_id, :id
    field :game_id, :id
  end

  object :person do
    field :id, :id
    field :name, :string
  end
end

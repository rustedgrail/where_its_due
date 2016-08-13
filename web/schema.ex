defmodule WhereItsDue.Schema do
  use Absinthe.Schema

  import_types WhereItsDue.Schema.Types

  query do
    field :games, list_of(:game) do
      resolve &WhereItsDue.GameResolver.all/2
    end
  end
end

defmodule WhereItsDue.Schema do
  use Absinthe.Schema

  import_types WhereItsDue.Schema.Types

  query do
    field :games, list_of(:game) do
      resolve &WhereItsDue.GameResolver.all/2
    end

    field :roles, list_of(:role) do
      resolve &WhereItsDue.RoleResolver.all/2
    end

    field :people, list_of(:person) do
      resolve &WhereItsDue.PersonResolver.all/2
    end
  end
end

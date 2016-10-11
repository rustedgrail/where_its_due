defmodule WhereItsDue.RoleResolver do
  alias WhereItsDue.Role

  def all(_args, _info) do
    {:ok, WhereItsDue.Repo.all(Role)}
  end
end

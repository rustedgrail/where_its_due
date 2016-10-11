defmodule WhereItsDue.PersonResolver do
  alias WhereItsDue.Person

  def all(_args, _info) do
    {:ok, WhereItsDue.Repo.all(Person)}
  end
end

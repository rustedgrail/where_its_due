defmodule WhereItsDue.GameResolver do
  alias WhereItsDue.Game

  def all(_args, _info) do
    {:ok, WhereItsDue.Repo.all(Game)}
  end
end

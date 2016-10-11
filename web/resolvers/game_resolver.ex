defmodule WhereItsDue.GameResolver do
  alias WhereItsDue.Game

  import Ecto.Query

  def all(_args, _info) do
    {:ok, WhereItsDue.Repo.all(from g in Game, preload: [:roles, :people])}
  end
end

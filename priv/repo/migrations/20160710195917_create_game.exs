defmodule WhereItsDue.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :description, :text
      add :giant_bomb_id, :integer
      add :image, {:array, :string}
      add :aliases, {:array, :string}
      add :name, :string
      add :deck, :text

      timestamps
    end

  end
end

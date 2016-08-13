defmodule WhereItsDue.Repo.Migrations.CreateFranchise do
  use Ecto.Migration

  def change do
    create table(:franchises) do
      add :name, :string
      add :deck, :text
      add :description, :text
      add :giant_bomb_id, :integer

      timestamps
    end

  end
end

defmodule WhereItsDue.Repo.Migrations.CreatePlatform do
  use Ecto.Migration

  def change do
    create table(:platforms) do
      add :abbreviation, :string
      add :deck, :text
      add :description, :text
      add :giant_bomb_id, :integer
      add :name, :string
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps
    end
    create index(:platforms, [:company_id])

  end
end

defmodule WhereItsDue.Repo.Migrations.CreateRole do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :role, :string
      add :person_id, references(:people, on_delete: :nothing)
      add :game_id, references(:games, on_delete: :nothing)

      timestamps
    end
    create index(:roles, [:person_id])
    create index(:roles, [:game_id])

  end
end

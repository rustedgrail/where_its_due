defmodule WhereItsDue.Repo.Migrations.CreatePerson do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :aliases, {:array, :string}
      add :deck, :text
      add :description, :text
      add :gender, :string
      add :giant_bomb_id, :integer
      add :name, :string

      timestamps
    end

  end
end

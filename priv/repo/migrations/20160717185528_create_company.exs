defmodule WhereItsDue.Repo.Migrations.CreateCompany do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :abbreviation, :string
      add :aliases, {:array, :string}
      add :deck, :text
      add :description, :text
      add :giant_bomb_id, :integer
      add :name, :string

      timestamps
    end

  end
end

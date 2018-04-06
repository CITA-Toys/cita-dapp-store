defmodule CitaDappStore.Repo.Migrations.CreateChains do
  use Ecto.Migration

  def change do
    create table(:chains) do
      add :name, :string
      add :server, :string
      add :desc, :text

      timestamps()
    end

    create unique_index(:chains, [:server])
  end
end

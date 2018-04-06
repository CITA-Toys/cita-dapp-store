defmodule CitaDappStore.Repo.Migrations.CreateDapps do
  use Ecto.Migration

  def change do
    create table(:dapps) do
      add :name, :string
      add :cover, :string
      add :addr, :string
      add :abi, :string
      add :desc, :text

      timestamps()
    end

    create unique_index(:dapps, [:addr])
  end
end

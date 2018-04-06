defmodule CitaDappStore.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :addr, :string
      add :avatar, :string

      timestamps()
    end

    create unique_index(:users, [:addr])
  end
end

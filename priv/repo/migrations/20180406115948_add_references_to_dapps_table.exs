defmodule CitaDappStore.Repo.Migrations.AddReferencesToDappsTable do
  use Ecto.Migration

  def change do
    alter table(:dapps) do
      add(:user_id, references(:users))
      add(:chain_id, references(:chains))
    end
  end
end

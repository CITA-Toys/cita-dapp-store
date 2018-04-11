defmodule CitaDappStore.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add(:title, :string)
      add(:content, :text)
      add(:author_id, references(:users, on_delete: :delete_all))

      timestamps()
    end

    create(index(:articles, [:author_id]))
  end
end

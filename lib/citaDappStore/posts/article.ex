defmodule CitaDappStore.Posts.Article do
  use Ecto.Schema
  import Ecto.Changeset
  alias CitaDappStore.Accounts.User

  schema "articles" do
    field(:content, :string)
    field(:title, :string)
    belongs_to(:author, User)

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end

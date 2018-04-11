defmodule CitaDappStore.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias CitaDappStore.Store.Dapp
  alias CitaDappStore.Posts.Article

  schema "users" do
    field(:addr, :string)
    field(:avatar, :string)
    field(:username, :string)
    has_many(:dapps, Dapp)
    has_many(:articles, Article)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :addr, :avatar])
    |> validate_required([:username, :addr, :avatar])
    |> unique_constraint(:addr)
  end
end

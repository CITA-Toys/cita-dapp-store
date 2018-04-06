defmodule CitaDappStore.Store.Dapp do
  use Ecto.Schema
  import Ecto.Changeset

  alias CitaDappStore.Accounts.User
  alias CitaDappStore.Organization.Chain

  schema "dapps" do
    field(:abi, :string)
    field(:addr, :string)
    field(:cover, :string)
    field(:desc, :string)
    field(:name, :string)
    belongs_to(:user, User)
    belongs_to(:chain, Chain)

    timestamps()
  end

  @doc false
  def changeset(dapp, attrs) do
    dapp
    |> cast(attrs, [:name, :cover, :addr, :abi, :desc])
    |> validate_required([:name, :cover, :addr, :abi, :desc])
    |> unique_constraint(:addr)
  end
end

defmodule CitaDappStore.Organization.Chain do
  use Ecto.Schema
  import Ecto.Changeset
  alias CitaDappStore.Store.Dapp

  schema "chains" do
    field(:desc, :string)
    field(:name, :string)
    field(:server, :string)
    has_many(:dapps, Dapp)

    timestamps()
  end

  @doc false
  def changeset(chain, attrs) do
    chain
    |> cast(attrs, [:name, :server, :desc])
    |> validate_required([:name, :server, :desc])
    |> unique_constraint(:server)
  end
end

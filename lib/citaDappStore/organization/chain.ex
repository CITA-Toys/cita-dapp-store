defmodule CitaDappStore.Organization.Chain do
  use Ecto.Schema
  import Ecto.Changeset


  schema "chains" do
    field :desc, :string
    field :name, :string
    field :server, :string

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

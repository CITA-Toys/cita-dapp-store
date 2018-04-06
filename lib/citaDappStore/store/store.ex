defmodule CitaDappStore.Store do
  @moduledoc """
  The Store context.
  """

  import Ecto.Query, warn: false
  alias CitaDappStore.Repo

  alias CitaDappStore.Store.Dapp

  @doc """
  Returns the list of dapps.

  ## Examples

      iex> list_dapps()
      [%Dapp{}, ...]

  """
  def list_dapps do
    Repo.all(Dapp)
  end

  @doc """
  Gets a single dapp.

  Raises `Ecto.NoResultsError` if the Dapp does not exist.

  ## Examples

      iex> get_dapp!(123)
      %Dapp{}

      iex> get_dapp!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dapp!(id), do: Repo.get!(Dapp, id)

  @doc """
  Creates a dapp.

  ## Examples

      iex> create_dapp(%{field: value})
      {:ok, %Dapp{}}

      iex> create_dapp(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dapp(attrs \\ %{}) do
    %Dapp{}
    |> Dapp.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dapp.

  ## Examples

      iex> update_dapp(dapp, %{field: new_value})
      {:ok, %Dapp{}}

      iex> update_dapp(dapp, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dapp(%Dapp{} = dapp, attrs) do
    dapp
    |> Dapp.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Dapp.

  ## Examples

      iex> delete_dapp(dapp)
      {:ok, %Dapp{}}

      iex> delete_dapp(dapp)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dapp(%Dapp{} = dapp) do
    Repo.delete(dapp)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dapp changes.

  ## Examples

      iex> change_dapp(dapp)
      %Ecto.Changeset{source: %Dapp{}}

  """
  def change_dapp(%Dapp{} = dapp) do
    Dapp.changeset(dapp, %{})
  end
end

defmodule CitaDappStore.Organization do
  @moduledoc """
  The Organization context.
  """

  import Ecto.Query, warn: false
  alias CitaDappStore.Repo

  alias CitaDappStore.Organization.Chain

  @doc """
  Returns the list of chains.

  ## Examples

      iex> list_chains()
      [%Chain{}, ...]

  """
  def list_chains do
    Repo.all(Chain)
  end

  @doc """
  Gets a single chain.

  Raises `Ecto.NoResultsError` if the Chain does not exist.

  ## Examples

      iex> get_chain!(123)
      %Chain{}

      iex> get_chain!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chain!(id), do: Repo.get!(Chain, id)

  @doc """
  Creates a chain.

  ## Examples

      iex> create_chain(%{field: value})
      {:ok, %Chain{}}

      iex> create_chain(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chain(attrs \\ %{}) do
    %Chain{}
    |> Chain.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chain.

  ## Examples

      iex> update_chain(chain, %{field: new_value})
      {:ok, %Chain{}}

      iex> update_chain(chain, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chain(%Chain{} = chain, attrs) do
    chain
    |> Chain.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Chain.

  ## Examples

      iex> delete_chain(chain)
      {:ok, %Chain{}}

      iex> delete_chain(chain)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chain(%Chain{} = chain) do
    Repo.delete(chain)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chain changes.

  ## Examples

      iex> change_chain(chain)
      %Ecto.Changeset{source: %Chain{}}

  """
  def change_chain(%Chain{} = chain) do
    Chain.changeset(chain, %{})
  end
end

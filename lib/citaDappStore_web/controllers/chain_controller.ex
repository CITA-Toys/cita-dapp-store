defmodule CitaDappStoreWeb.ChainController do
  use CitaDappStoreWeb, :controller

  alias CitaDappStore.Organization
  alias CitaDappStore.Organization.Chain

  def index(conn, _params) do
    chains = Organization.list_chains()
    render(conn, "index.html", chains: chains)
  end

  def new(conn, _params) do
    changeset = Organization.change_chain(%Chain{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chain" => chain_params}) do
    case Organization.create_chain(chain_params) do
      {:ok, chain} ->
        conn
        |> put_flash(:info, "Chain created successfully.")
        |> redirect(to: chain_path(conn, :show, chain))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chain = Organization.get_chain!(id)
    render(conn, "show.html", chain: chain)
  end

  def edit(conn, %{"id" => id}) do
    chain = Organization.get_chain!(id)
    changeset = Organization.change_chain(chain)
    render(conn, "edit.html", chain: chain, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chain" => chain_params}) do
    chain = Organization.get_chain!(id)

    case Organization.update_chain(chain, chain_params) do
      {:ok, chain} ->
        conn
        |> put_flash(:info, "Chain updated successfully.")
        |> redirect(to: chain_path(conn, :show, chain))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chain: chain, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chain = Organization.get_chain!(id)
    {:ok, _chain} = Organization.delete_chain(chain)

    conn
    |> put_flash(:info, "Chain deleted successfully.")
    |> redirect(to: chain_path(conn, :index))
  end
end

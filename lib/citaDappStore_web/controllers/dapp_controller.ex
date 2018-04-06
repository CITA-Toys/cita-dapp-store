defmodule CitaDappStoreWeb.DappController do
  use CitaDappStoreWeb, :controller

  alias CitaDappStore.Store
  alias CitaDappStore.Store.Dapp

  def index(conn, _params) do
    dapps = Store.list_dapps()
    render(conn, "index.html", dapps: dapps)
  end

  def new(conn, _params) do
    changeset = Store.change_dapp(%Dapp{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dapp" => dapp_params}) do
    case Store.create_dapp(dapp_params) do
      {:ok, dapp} ->
        conn
        |> put_flash(:info, "Dapp created successfully.")
        |> redirect(to: dapp_path(conn, :show, dapp))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dapp = Store.get_dapp!(id)
    render(conn, "show.html", dapp: dapp)
  end

  def edit(conn, %{"id" => id}) do
    dapp = Store.get_dapp!(id)
    changeset = Store.change_dapp(dapp)
    render(conn, "edit.html", dapp: dapp, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dapp" => dapp_params}) do
    dapp = Store.get_dapp!(id)

    case Store.update_dapp(dapp, dapp_params) do
      {:ok, dapp} ->
        conn
        |> put_flash(:info, "Dapp updated successfully.")
        |> redirect(to: dapp_path(conn, :show, dapp))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", dapp: dapp, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dapp = Store.get_dapp!(id)
    {:ok, _dapp} = Store.delete_dapp(dapp)

    conn
    |> put_flash(:info, "Dapp deleted successfully.")
    |> redirect(to: dapp_path(conn, :index))
  end
end

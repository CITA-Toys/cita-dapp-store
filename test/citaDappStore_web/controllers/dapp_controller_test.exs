defmodule CitaDappStoreWeb.DappControllerTest do
  use CitaDappStoreWeb.ConnCase

  alias CitaDappStore.Store

  @create_attrs %{abi: "some abi", addr: "some addr", cover: "some cover", desc: "some desc", name: "some name"}
  @update_attrs %{abi: "some updated abi", addr: "some updated addr", cover: "some updated cover", desc: "some updated desc", name: "some updated name"}
  @invalid_attrs %{abi: nil, addr: nil, cover: nil, desc: nil, name: nil}

  def fixture(:dapp) do
    {:ok, dapp} = Store.create_dapp(@create_attrs)
    dapp
  end

  describe "index" do
    test "lists all dapps", %{conn: conn} do
      conn = get conn, dapp_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Dapps"
    end
  end

  describe "new dapp" do
    test "renders form", %{conn: conn} do
      conn = get conn, dapp_path(conn, :new)
      assert html_response(conn, 200) =~ "New Dapp"
    end
  end

  describe "create dapp" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, dapp_path(conn, :create), dapp: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == dapp_path(conn, :show, id)

      conn = get conn, dapp_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Dapp"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, dapp_path(conn, :create), dapp: @invalid_attrs
      assert html_response(conn, 200) =~ "New Dapp"
    end
  end

  describe "edit dapp" do
    setup [:create_dapp]

    test "renders form for editing chosen dapp", %{conn: conn, dapp: dapp} do
      conn = get conn, dapp_path(conn, :edit, dapp)
      assert html_response(conn, 200) =~ "Edit Dapp"
    end
  end

  describe "update dapp" do
    setup [:create_dapp]

    test "redirects when data is valid", %{conn: conn, dapp: dapp} do
      conn = put conn, dapp_path(conn, :update, dapp), dapp: @update_attrs
      assert redirected_to(conn) == dapp_path(conn, :show, dapp)

      conn = get conn, dapp_path(conn, :show, dapp)
      assert html_response(conn, 200) =~ "some updated abi"
    end

    test "renders errors when data is invalid", %{conn: conn, dapp: dapp} do
      conn = put conn, dapp_path(conn, :update, dapp), dapp: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Dapp"
    end
  end

  describe "delete dapp" do
    setup [:create_dapp]

    test "deletes chosen dapp", %{conn: conn, dapp: dapp} do
      conn = delete conn, dapp_path(conn, :delete, dapp)
      assert redirected_to(conn) == dapp_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, dapp_path(conn, :show, dapp)
      end
    end
  end

  defp create_dapp(_) do
    dapp = fixture(:dapp)
    {:ok, dapp: dapp}
  end
end

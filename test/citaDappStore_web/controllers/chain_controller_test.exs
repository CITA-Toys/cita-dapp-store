defmodule CitaDappStoreWeb.ChainControllerTest do
  use CitaDappStoreWeb.ConnCase

  alias CitaDappStore.Organization

  @create_attrs %{desc: "some desc", name: "some name", server: "some server"}
  @update_attrs %{desc: "some updated desc", name: "some updated name", server: "some updated server"}
  @invalid_attrs %{desc: nil, name: nil, server: nil}

  def fixture(:chain) do
    {:ok, chain} = Organization.create_chain(@create_attrs)
    chain
  end

  describe "index" do
    test "lists all chains", %{conn: conn} do
      conn = get conn, chain_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Chains"
    end
  end

  describe "new chain" do
    test "renders form", %{conn: conn} do
      conn = get conn, chain_path(conn, :new)
      assert html_response(conn, 200) =~ "New Chain"
    end
  end

  describe "create chain" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, chain_path(conn, :create), chain: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == chain_path(conn, :show, id)

      conn = get conn, chain_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Chain"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, chain_path(conn, :create), chain: @invalid_attrs
      assert html_response(conn, 200) =~ "New Chain"
    end
  end

  describe "edit chain" do
    setup [:create_chain]

    test "renders form for editing chosen chain", %{conn: conn, chain: chain} do
      conn = get conn, chain_path(conn, :edit, chain)
      assert html_response(conn, 200) =~ "Edit Chain"
    end
  end

  describe "update chain" do
    setup [:create_chain]

    test "redirects when data is valid", %{conn: conn, chain: chain} do
      conn = put conn, chain_path(conn, :update, chain), chain: @update_attrs
      assert redirected_to(conn) == chain_path(conn, :show, chain)

      conn = get conn, chain_path(conn, :show, chain)
      assert html_response(conn, 200) =~ "some updated desc"
    end

    test "renders errors when data is invalid", %{conn: conn, chain: chain} do
      conn = put conn, chain_path(conn, :update, chain), chain: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Chain"
    end
  end

  describe "delete chain" do
    setup [:create_chain]

    test "deletes chosen chain", %{conn: conn, chain: chain} do
      conn = delete conn, chain_path(conn, :delete, chain)
      assert redirected_to(conn) == chain_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, chain_path(conn, :show, chain)
      end
    end
  end

  defp create_chain(_) do
    chain = fixture(:chain)
    {:ok, chain: chain}
  end
end

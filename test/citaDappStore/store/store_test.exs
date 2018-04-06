defmodule CitaDappStore.StoreTest do
  use CitaDappStore.DataCase

  alias CitaDappStore.Store

  describe "dapps" do
    alias CitaDappStore.Store.Dapp

    @valid_attrs %{abi: "some abi", addr: "some addr", cover: "some cover", desc: "some desc", name: "some name"}
    @update_attrs %{abi: "some updated abi", addr: "some updated addr", cover: "some updated cover", desc: "some updated desc", name: "some updated name"}
    @invalid_attrs %{abi: nil, addr: nil, cover: nil, desc: nil, name: nil}

    def dapp_fixture(attrs \\ %{}) do
      {:ok, dapp} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_dapp()

      dapp
    end

    test "list_dapps/0 returns all dapps" do
      dapp = dapp_fixture()
      assert Store.list_dapps() == [dapp]
    end

    test "get_dapp!/1 returns the dapp with given id" do
      dapp = dapp_fixture()
      assert Store.get_dapp!(dapp.id) == dapp
    end

    test "create_dapp/1 with valid data creates a dapp" do
      assert {:ok, %Dapp{} = dapp} = Store.create_dapp(@valid_attrs)
      assert dapp.abi == "some abi"
      assert dapp.addr == "some addr"
      assert dapp.cover == "some cover"
      assert dapp.desc == "some desc"
      assert dapp.name == "some name"
    end

    test "create_dapp/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_dapp(@invalid_attrs)
    end

    test "update_dapp/2 with valid data updates the dapp" do
      dapp = dapp_fixture()
      assert {:ok, dapp} = Store.update_dapp(dapp, @update_attrs)
      assert %Dapp{} = dapp
      assert dapp.abi == "some updated abi"
      assert dapp.addr == "some updated addr"
      assert dapp.cover == "some updated cover"
      assert dapp.desc == "some updated desc"
      assert dapp.name == "some updated name"
    end

    test "update_dapp/2 with invalid data returns error changeset" do
      dapp = dapp_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_dapp(dapp, @invalid_attrs)
      assert dapp == Store.get_dapp!(dapp.id)
    end

    test "delete_dapp/1 deletes the dapp" do
      dapp = dapp_fixture()
      assert {:ok, %Dapp{}} = Store.delete_dapp(dapp)
      assert_raise Ecto.NoResultsError, fn -> Store.get_dapp!(dapp.id) end
    end

    test "change_dapp/1 returns a dapp changeset" do
      dapp = dapp_fixture()
      assert %Ecto.Changeset{} = Store.change_dapp(dapp)
    end
  end
end

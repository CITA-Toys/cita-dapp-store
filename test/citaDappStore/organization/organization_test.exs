defmodule CitaDappStore.OrganizationTest do
  use CitaDappStore.DataCase

  alias CitaDappStore.Organization

  describe "chains" do
    alias CitaDappStore.Organization.Chain

    @valid_attrs %{desc: "some desc", name: "some name", server: "some server"}
    @update_attrs %{desc: "some updated desc", name: "some updated name", server: "some updated server"}
    @invalid_attrs %{desc: nil, name: nil, server: nil}

    def chain_fixture(attrs \\ %{}) do
      {:ok, chain} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organization.create_chain()

      chain
    end

    test "list_chains/0 returns all chains" do
      chain = chain_fixture()
      assert Organization.list_chains() == [chain]
    end

    test "get_chain!/1 returns the chain with given id" do
      chain = chain_fixture()
      assert Organization.get_chain!(chain.id) == chain
    end

    test "create_chain/1 with valid data creates a chain" do
      assert {:ok, %Chain{} = chain} = Organization.create_chain(@valid_attrs)
      assert chain.desc == "some desc"
      assert chain.name == "some name"
      assert chain.server == "some server"
    end

    test "create_chain/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_chain(@invalid_attrs)
    end

    test "update_chain/2 with valid data updates the chain" do
      chain = chain_fixture()
      assert {:ok, chain} = Organization.update_chain(chain, @update_attrs)
      assert %Chain{} = chain
      assert chain.desc == "some updated desc"
      assert chain.name == "some updated name"
      assert chain.server == "some updated server"
    end

    test "update_chain/2 with invalid data returns error changeset" do
      chain = chain_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_chain(chain, @invalid_attrs)
      assert chain == Organization.get_chain!(chain.id)
    end

    test "delete_chain/1 deletes the chain" do
      chain = chain_fixture()
      assert {:ok, %Chain{}} = Organization.delete_chain(chain)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_chain!(chain.id) end
    end

    test "change_chain/1 returns a chain changeset" do
      chain = chain_fixture()
      assert %Ecto.Changeset{} = Organization.change_chain(chain)
    end
  end
end

defmodule HrsmsConsumer.BusinessTest do
  use HrsmsConsumer.DataCase

  alias HrsmsConsumer.Business

  describe "stores" do
    alias HrsmsConsumer.Business.Store

    import HrsmsConsumer.BusinessFixtures

    @invalid_attrs %{location: nil, store_num: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert Business.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert Business.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{location: "some location", store_num: 42}

      assert {:ok, %Store{} = store} = Business.create_store(valid_attrs)
      assert store.location == "some location"
      assert store.store_num == 42
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{location: "some updated location", store_num: 43}

      assert {:ok, %Store{} = store} = Business.update_store(store, update_attrs)
      assert store.location == "some updated location"
      assert store.store_num == 43
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_store(store, @invalid_attrs)
      assert store == Business.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = Business.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> Business.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = Business.change_store(store)
    end
  end

  describe "products" do
    alias HrsmsConsumer.Business.Product

    import HrsmsConsumer.BusinessFixtures

    @invalid_attrs %{inventory: nil, product_name: nil, retail: nil, vendor_name: nil, wholesale: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Business.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Business.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{inventory: 42, product_name: "some product_name", retail: 42, vendor_name: "some vendor_name", wholesale: 42}

      assert {:ok, %Product{} = product} = Business.create_product(valid_attrs)
      assert product.inventory == 42
      assert product.product_name == "some product_name"
      assert product.retail == 42
      assert product.vendor_name == "some vendor_name"
      assert product.wholesale == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{inventory: 43, product_name: "some updated product_name", retail: 43, vendor_name: "some updated vendor_name", wholesale: 43}

      assert {:ok, %Product{} = product} = Business.update_product(product, update_attrs)
      assert product.inventory == 43
      assert product.product_name == "some updated product_name"
      assert product.retail == 43
      assert product.vendor_name == "some updated vendor_name"
      assert product.wholesale == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_product(product, @invalid_attrs)
      assert product == Business.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Business.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Business.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Business.change_product(product)
    end
  end
end

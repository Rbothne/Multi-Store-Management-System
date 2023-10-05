defmodule HrsmsConsumer.BusinessFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HrsmsConsumer.Business` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        location: "some location",
        store_num: 42
      })
      |> HrsmsConsumer.Business.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        inventory: 42,
        product_name: "some product_name",
        retail: 42,
        vendor_name: "some vendor_name",
        wholesale: 42
      })
      |> HrsmsConsumer.Business.create_product()

    product
  end
end

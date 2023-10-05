defmodule HrsmsConsumer.Business.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias HrsmsConsumer.Business.Store

  schema "products" do
    field :inventory, :integer
    field :product_name, :string
    field :retail, :integer
    field :vendor_name, :string
    field :wholesale, :integer
    belongs_to :store, Store

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:product_name, :vendor_name, :wholesale, :retail, :inventory, :store_id])
    |> validate_required([:product_name, :vendor_name, :wholesale, :retail, :inventory, :store_id])
  end
end

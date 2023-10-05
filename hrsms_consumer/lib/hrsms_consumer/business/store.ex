defmodule HrsmsConsumer.Business.Store do
  use Ecto.Schema
  import Ecto.Changeset

  alias HrsmsConsumer.Business.Product

  schema "stores" do
    field :location, :string
    field :store_num, :integer
    has_many :products, Product

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:location, :store_num])
    |> validate_required([:location, :store_num])
  end
end

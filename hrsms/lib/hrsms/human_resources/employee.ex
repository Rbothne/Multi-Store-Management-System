defmodule Hrsms.HumanResources.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :date_of_hire, :date
    field :department, :string
    field :emp, :integer
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:emp, :last_name, :first_name, :date_of_hire, :department])
    |> validate_required([:emp, :last_name, :first_name, :date_of_hire, :department])
  end
end

defmodule Hrsms.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :emp, :integer
      add :last_name, :string
      add :first_name, :string
      add :date_of_hire, :date
      add :department, :string

      timestamps()
    end
  end
end

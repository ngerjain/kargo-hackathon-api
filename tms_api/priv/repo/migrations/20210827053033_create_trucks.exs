defmodule TmsApi.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :license_number, :string
      add :license_type, :string
      add :truck_type, :string
      add :production_year, :integer
      add :stnk_file, :string
      add :kir_file, :string
      add :status, :boolean, default: false, null: false

      timestamps()
    end

  end
end

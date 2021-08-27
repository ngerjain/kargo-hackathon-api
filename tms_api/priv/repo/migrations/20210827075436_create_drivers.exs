defmodule TmsApi.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :driver_name, :string
      add :phone_number, :string
      add :driver_license_file, :string
      add :id_card_file, :string
      add :status, :boolean, default: false, null: false

      timestamps()
    end

  end
end

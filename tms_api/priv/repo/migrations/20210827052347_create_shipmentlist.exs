defmodule TmsApi.Repo.Migrations.CreateShipmentlist do
  use Ecto.Migration

  def change do
    create table(:shipmentlist) do
      add :license_number, :string 
      add :driver_id, :string
      add :destination, :string
      add :origin, :string
      add :loading_date, :string
      add :status, :string
      add :shipment_number, :string

      timestamps()
    end

  end
end

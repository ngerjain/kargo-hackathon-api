defmodule TmsApi.Schema.ShipmentList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipmentlist" do 
    field :destination, :string
    field :driver_id, :string
    field :license_number, :string
    field :loading_date, :string
    field :origin, :string
    field :shipment_number, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(shipment_list, attrs) do
    shipment_list
    |> cast(attrs, [:license_number, :driver_id, :destination, :origin, :loading_date, :status, :shipment_number])
    |> validate_required([:license_number, :driver_id, :destination, :origin, :loading_date, :status, :shipment_number])
  end
end

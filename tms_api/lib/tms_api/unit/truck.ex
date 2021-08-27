defmodule TmsApi.Unit.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :kir_file, :string
    field :license_number, :string
    field :license_type, :string
    field :production_year, :integer
    field :status, :boolean, default: true
    field :stnk_file, :string
    field :truck_type, :string

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:license_number, :license_type, :truck_type, :production_year, :stnk_file, :kir_file, :status])
    |> validate_required([:license_number, :license_type, :truck_type, :production_year, :status])
  end
end

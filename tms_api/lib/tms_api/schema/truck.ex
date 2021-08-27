defmodule TmsApi.Schema.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  
  schema "trucks" do
    field :license_number, :string
    field :license_type, :string
    field :production_year, :integer
    field :kir_file, :string
    field :stnk_file, :string
    field :truck_type, :string
    field :status, :boolean, default: true
    
    timestamps()
  end
  
  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:license_number, :license_type, :truck_type, :production_year, :stnk_file, :kir_file, :status])
    |> validate_required([:license_number, :license_type, :truck_type, :production_year, :status])
  end

  # Define license and truck types here using constant
  def types, do: %{license_types:  ["Black", "Yellow"], truck_types: ["Tronton", "Container"]}
end

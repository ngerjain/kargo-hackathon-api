defmodule TmsApi.Repo.Driver.Schema.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :driver_license_file, :string
    field :driver_name, :string
    field :id_card_file, :string
    field :phone_number, :string
    field :status, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:driver_name, :phone_number, :driver_license_file, :id_card_file, :status])
    |> validate_required([:driver_name, :phone_number, :driver_license_file, :id_card_file, :status])
  end
end

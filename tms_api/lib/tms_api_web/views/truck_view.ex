defmodule TmsApiWeb.TruckView do
  use TmsApiWeb, :view
  alias TmsApiWeb.TruckView

  def render("index.json", %{trucks: trucks}) do
    %{data: render_many(trucks, TruckView, "truck.json")}
  end

  def render("show.json", %{truck: truck}) do
    %{data: render_one(truck, TruckView, "truck.json")}
  end

  def render("truck.json", %{truck: truck}) do
    %{id: truck.id,
      license_number: truck.license_number,
      license_type: truck.license_type,
      truck_type: truck.truck_type,
      production_year: truck.production_year,
      stnk_file: truck.stnk_file,
      kir_file: truck.kir_file,
      status: truck.status}
  end

  # def render("types.json", %{types: types}) do
  #   %{data: render_one(types, TruckView, "format_types.json")}
  # end

  # def render("format_types.json", %{types: types}) do
  #   %{license_types: types.license_types, truck_types: types.truck_types}
  # end
end

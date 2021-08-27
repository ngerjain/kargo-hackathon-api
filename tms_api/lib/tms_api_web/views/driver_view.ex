defmodule TmsApiWeb.DriverView do
  use TmsApiWeb, :view
  alias TmsApiWeb.DriverView

  def render("index.json", %{drivers: drivers}) do
    %{data: render_many(drivers, DriverView, "driver.json")}
  end

  def render("show.json", %{driver: driver}) do
    %{data: render_one(driver, DriverView, "driver.json")}
  end

  def render("driver.json", %{driver: driver}) do
    %{id: driver.id,
      driver_name: driver.driver_name,
      phone_number: driver.phone_number,
      driver_license_file: driver.driver_license_file,
      id_card_file: driver.id_card_file,
      status: driver.status}
  end
end

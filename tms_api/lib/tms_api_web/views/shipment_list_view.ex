defmodule TmsApiWeb.ShipmentListView do
  use TmsApiWeb, :view
  alias TmsApiWeb.ShipmentListView

  def render("index.json", %{shipmentlist: shipmentlist}) do
    %{data: render_many(shipmentlist, ShipmentListView, "shipment_list.json")}
  end

  def render("show.json", %{shipment_list: shipment_list}) do
    %{data: render_one(shipment_list, ShipmentListView, "shipment_list.json")}
  end

  def render("shipment_list.json", %{shipment_list: shipment_list}) do
    %{id: shipment_list.id,
      license_number: shipment_list.license_number, 
      driver_id: shipment_list.driver_id, 
      destination: shipment_list.destination, 
      origin: shipment_list.origin, 
      loading_date: shipment_list.loading_date, 
      status: shipment_list.status, 
      shipment_number: shipment_list.shipment_number}
  end
end

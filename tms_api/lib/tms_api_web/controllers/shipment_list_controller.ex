defmodule TmsApiWeb.ShipmentListController do
  use TmsApiWeb, :controller

  alias TmsApi.Schema
  alias TmsApi.Schema.ShipmentList

  action_fallback TmsApiWeb.FallbackController

  def index(conn, _params) do
    shipmentlist = Schema.list_shipmentlist()
    render(conn, "index.json", shipmentlist: shipmentlist)
  end

  def create(conn, %{"shipment_list" => shipment_list_params}) do
    with {:ok, %ShipmentList{} = shipment_list} <- Schema.create_shipment_list(shipment_list_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.shipment_list_path(conn, :show, shipment_list))
      |> render("show.json", shipment_list: shipment_list)
    end
  end

  def show(conn, %{"id" => id}) do
    shipment_list = Schema.get_shipment_list!(id)
    render(conn, "show.json", shipment_list: shipment_list)
  end

  def update(conn, %{"id" => id, "shipment_list" => shipment_list_params}) do
    shipment_list = Schema.get_shipment_list!(id)

    with {:ok, %ShipmentList{} = shipment_list} <- Schema.update_shipment_list(shipment_list, shipment_list_params) do
      render(conn, "show.json", shipment_list: shipment_list)
    end
  end

  def delete(conn, %{"id" => id}) do
    shipment_list = Schema.get_shipment_list!(id)

    with {:ok, %ShipmentList{}} <- Schema.delete_shipment_list(shipment_list) do
      send_resp(conn, :no_content, "")
    end
  end
end

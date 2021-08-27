defmodule TmsApiWeb.ShipmentListControllerTest do
  use TmsApiWeb.ConnCase

  alias TmsApi.Schema
  alias TmsApi.Schema.ShipmentList

  @create_attrs %{
    : "some ",
    destination: "some destination",
    driver_id: "some driver_id",
    license_number,: "some license_number,",
    loading_date: "some loading_date",
    origin: "some origin",
    shipment_number: "some shipment_number",
    status: "some status"
  }
  @update_attrs %{
    : "some updated ",
    destination: "some updated destination",
    driver_id: "some updated driver_id",
    license_number,: "some updated license_number,",
    loading_date: "some updated loading_date",
    origin: "some updated origin",
    shipment_number: "some updated shipment_number",
    status: "some updated status"
  }
  @invalid_attrs %{"": nil, destination: nil, driver_id: nil, "license_number,": nil, loading_date: nil, origin: nil, shipment_number: nil, status: nil}

  def fixture(:shipment_list) do
    {:ok, shipment_list} = Schema.create_shipment_list(@create_attrs)
    shipment_list
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shipmentlist", %{conn: conn} do
      conn = get(conn, Routes.shipment_list_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shipment_list" do
    test "renders shipment_list when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shipment_list_path(conn, :create), shipment_list: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shipment_list_path(conn, :show, id))

      assert %{
               "id" => id,
               "" => "some ",
               "destination" => "some destination",
               "driver_id" => "some driver_id",
               "license_number," => "some license_number,",
               "loading_date" => "some loading_date",
               "origin" => "some origin",
               "shipment_number" => "some shipment_number",
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shipment_list_path(conn, :create), shipment_list: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shipment_list" do
    setup [:create_shipment_list]

    test "renders shipment_list when data is valid", %{conn: conn, shipment_list: %ShipmentList{id: id} = shipment_list} do
      conn = put(conn, Routes.shipment_list_path(conn, :update, shipment_list), shipment_list: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shipment_list_path(conn, :show, id))

      assert %{
               "id" => id,
               "" => "some updated ",
               "destination" => "some updated destination",
               "driver_id" => "some updated driver_id",
               "license_number," => "some updated license_number,",
               "loading_date" => "some updated loading_date",
               "origin" => "some updated origin",
               "shipment_number" => "some updated shipment_number",
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shipment_list: shipment_list} do
      conn = put(conn, Routes.shipment_list_path(conn, :update, shipment_list), shipment_list: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shipment_list" do
    setup [:create_shipment_list]

    test "deletes chosen shipment_list", %{conn: conn, shipment_list: shipment_list} do
      conn = delete(conn, Routes.shipment_list_path(conn, :delete, shipment_list))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shipment_list_path(conn, :show, shipment_list))
      end
    end
  end

  defp create_shipment_list(_) do
    shipment_list = fixture(:shipment_list)
    %{shipment_list: shipment_list}
  end
end

defmodule TmsApiWeb.DriverControllerTest do
  use TmsApiWeb.ConnCase

  alias TmsApi.Repo.Driver
  alias TmsApi.Repo.Driver.Schema.Driver

  @create_attrs %{
    driver_license_file: "some driver_license_file",
    driver_name: "some driver_name",
    id_card_file: "some id_card_file",
    phone_number: "some phone_number",
    status: true
  }
  @update_attrs %{
    driver_license_file: "some updated driver_license_file",
    driver_name: "some updated driver_name",
    id_card_file: "some updated id_card_file",
    phone_number: "some updated phone_number",
    status: false
  }
  @invalid_attrs %{driver_license_file: nil, driver_name: nil, id_card_file: nil, phone_number: nil, status: nil}

  def fixture(:driver) do
    {:ok, driver} = Driver.create_driver(@create_attrs)
    driver
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all drivers", %{conn: conn} do
      conn = get(conn, Routes.driver_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create driver" do
    test "renders driver when data is valid", %{conn: conn} do
      conn = post(conn, Routes.driver_path(conn, :create), driver: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.driver_path(conn, :show, id))

      assert %{
               "id" => id,
               "driver_license_file" => "some driver_license_file",
               "driver_name" => "some driver_name",
               "id_card_file" => "some id_card_file",
               "phone_number" => "some phone_number",
               "status" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.driver_path(conn, :create), driver: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update driver" do
    setup [:create_driver]

    test "renders driver when data is valid", %{conn: conn, driver: %Driver{id: id} = driver} do
      conn = put(conn, Routes.driver_path(conn, :update, driver), driver: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.driver_path(conn, :show, id))

      assert %{
               "id" => id,
               "driver_license_file" => "some updated driver_license_file",
               "driver_name" => "some updated driver_name",
               "id_card_file" => "some updated id_card_file",
               "phone_number" => "some updated phone_number",
               "status" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, driver: driver} do
      conn = put(conn, Routes.driver_path(conn, :update, driver), driver: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete driver" do
    setup [:create_driver]

    test "deletes chosen driver", %{conn: conn, driver: driver} do
      conn = delete(conn, Routes.driver_path(conn, :delete, driver))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.driver_path(conn, :show, driver))
      end
    end
  end

  defp create_driver(_) do
    driver = fixture(:driver)
    %{driver: driver}
  end
end

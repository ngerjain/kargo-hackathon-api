defmodule TmsApiWeb.DriverController do
  use TmsApiWeb, :controller

  alias TmsApi.Repo.DriverRepo
  alias TmsApi.Repo.Driver.Schema.Driver

  action_fallback TmsApiWeb.FallbackController

  def index(conn, _params) do
    drivers = DriverRepo.list_drivers()
    render(conn, "index.json", drivers: drivers)
  end

  def create(conn, %{"driver" => driver_params}) do
    with {:ok, %Driver{} = driver} <- DriverRepo.create_driver(driver_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.driver_path(conn, :show, driver))
      |> render("show.json", driver: driver)
    end
  end

  def show(conn, %{"id" => id}) do
    driver = DriverRepo.get_driver!(id)
    render(conn, "show.json", driver: driver)
  end

  def update(conn, %{"id" => id, "driver" => driver_params}) do
    driver = DriverRepo.get_driver!(id)

    with {:ok, %Driver{} = driver} <- DriverRepo.update_driver(driver, driver_params) do
      render(conn, "show.json", driver: driver)
    end
  end

  def delete(conn, %{"id" => id}) do
    driver = DriverRepo.get_driver!(id)

    with {:ok, %Driver{}} <- DriverRepo.delete_driver(driver) do
      send_resp(conn, :no_content, "")
    end
  end
end

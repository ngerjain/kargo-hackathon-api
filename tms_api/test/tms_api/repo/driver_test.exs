defmodule TmsApi.Repo.DriverTest do
  use TmsApi.DataCase

  alias TmsApi.Repo.Driver

  describe "drivers" do
    alias TmsApi.Repo.Driver.Schema.Driver

    @valid_attrs %{driver_license_file: "some driver_license_file", driver_name: "some driver_name", id_card_file: "some id_card_file", phone_number: "some phone_number", status: true}
    @update_attrs %{driver_license_file: "some updated driver_license_file", driver_name: "some updated driver_name", id_card_file: "some updated id_card_file", phone_number: "some updated phone_number", status: false}
    @invalid_attrs %{driver_license_file: nil, driver_name: nil, id_card_file: nil, phone_number: nil, status: nil}

    def driver_fixture(attrs \\ %{}) do
      {:ok, driver} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Driver.create_driver()

      driver
    end

    test "list_drivers/0 returns all drivers" do
      driver = driver_fixture()
      assert Driver.list_drivers() == [driver]
    end

    test "get_driver!/1 returns the driver with given id" do
      driver = driver_fixture()
      assert Driver.get_driver!(driver.id) == driver
    end

    test "create_driver/1 with valid data creates a driver" do
      assert {:ok, %Driver{} = driver} = Driver.create_driver(@valid_attrs)
      assert driver.driver_license_file == "some driver_license_file"
      assert driver.driver_name == "some driver_name"
      assert driver.id_card_file == "some id_card_file"
      assert driver.phone_number == "some phone_number"
      assert driver.status == true
    end

    test "create_driver/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Driver.create_driver(@invalid_attrs)
    end

    test "update_driver/2 with valid data updates the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{} = driver} = Driver.update_driver(driver, @update_attrs)
      assert driver.driver_license_file == "some updated driver_license_file"
      assert driver.driver_name == "some updated driver_name"
      assert driver.id_card_file == "some updated id_card_file"
      assert driver.phone_number == "some updated phone_number"
      assert driver.status == false
    end

    test "update_driver/2 with invalid data returns error changeset" do
      driver = driver_fixture()
      assert {:error, %Ecto.Changeset{}} = Driver.update_driver(driver, @invalid_attrs)
      assert driver == Driver.get_driver!(driver.id)
    end

    test "delete_driver/1 deletes the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{}} = Driver.delete_driver(driver)
      assert_raise Ecto.NoResultsError, fn -> Driver.get_driver!(driver.id) end
    end

    test "change_driver/1 returns a driver changeset" do
      driver = driver_fixture()
      assert %Ecto.Changeset{} = Driver.change_driver(driver)
    end
  end
end

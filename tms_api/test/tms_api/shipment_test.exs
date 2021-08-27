defmodule TmsApi.ShipmentTest do
  use TmsApi.DataCase

  alias TmsApi.Shipment

  describe "shipmentlist" do
    alias TmsApi.Shipment.ShipmentList

    @valid_attrs %{"": "some ", destination: "some destination", driver_id: "some driver_id", license_number: "some license_number", loading_date: "some loading_date", origin: "some origin", shipment_number: "some shipment_number", status: "some status"}
    @update_attrs %{"": "some updated ", destination: "some updated destination", driver_id: "some updated driver_id", license_number: "some updated license_number", loading_date: "some updated loading_date", origin: "some updated origin", shipment_number: "some updated shipment_number", status: "some updated status"}
    @invalid_attrs %{"": nil, destination: nil, driver_id: nil, license_number: nil, loading_date: nil, origin: nil, shipment_number: nil, status: nil}

    def shipment_list_fixture(attrs \\ %{}) do
      {:ok, shipment_list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shipment.create_shipment_list()

      shipment_list
    end

    test "list_shipmentlist/0 returns all shipmentlist" do
      shipment_list = shipment_list_fixture()
      assert Shipment.list_shipmentlist() == [shipment_list]
    end

    test "get_shipment_list!/1 returns the shipment_list with given id" do
      shipment_list = shipment_list_fixture()
      assert Shipment.get_shipment_list!(shipment_list.id) == shipment_list
    end

    test "create_shipment_list/1 with valid data creates a shipment_list" do
      assert {:ok, %ShipmentList{} = shipment_list} = Shipment.create_shipment_list(@valid_attrs)
      assert shipment_list. == "some "
      assert shipment_list.destination == "some destination"
      assert shipment_list.driver_id == "some driver_id"
      assert shipment_list.license_number == "some license_number"
      assert shipment_list.loading_date == "some loading_date"
      assert shipment_list.origin == "some origin"
      assert shipment_list.shipment_number == "some shipment_number"
      assert shipment_list.status == "some status"
    end

    test "create_shipment_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shipment.create_shipment_list(@invalid_attrs)
    end

    test "update_shipment_list/2 with valid data updates the shipment_list" do
      shipment_list = shipment_list_fixture()
      assert {:ok, %ShipmentList{} = shipment_list} = Shipment.update_shipment_list(shipment_list, @update_attrs)
      assert shipment_list. == "some updated "
      assert shipment_list.destination == "some updated destination"
      assert shipment_list.driver_id == "some updated driver_id"
      assert shipment_list.license_number == "some updated license_number"
      assert shipment_list.loading_date == "some updated loading_date"
      assert shipment_list.origin == "some updated origin"
      assert shipment_list.shipment_number == "some updated shipment_number"
      assert shipment_list.status == "some updated status"
    end

    test "update_shipment_list/2 with invalid data returns error changeset" do
      shipment_list = shipment_list_fixture()
      assert {:error, %Ecto.Changeset{}} = Shipment.update_shipment_list(shipment_list, @invalid_attrs)
      assert shipment_list == Shipment.get_shipment_list!(shipment_list.id)
    end

    test "delete_shipment_list/1 deletes the shipment_list" do
      shipment_list = shipment_list_fixture()
      assert {:ok, %ShipmentList{}} = Shipment.delete_shipment_list(shipment_list)
      assert_raise Ecto.NoResultsError, fn -> Shipment.get_shipment_list!(shipment_list.id) end
    end

    test "change_shipment_list/1 returns a shipment_list changeset" do
      shipment_list = shipment_list_fixture()
      assert %Ecto.Changeset{} = Shipment.change_shipment_list(shipment_list)
    end
  end
end

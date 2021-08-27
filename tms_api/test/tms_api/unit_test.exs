defmodule TmsApi.UnitTest do
  use TmsApi.DataCase

  alias TmsApi.Unit

  describe "trucks" do
    alias TmsApi.Unit.Truck

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def truck_fixture(attrs \\ %{}) do
      {:ok, truck} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Unit.create_truck()

      truck
    end

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert Unit.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert Unit.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      assert {:ok, %Truck{} = truck} = Unit.create_truck(@valid_attrs)
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Unit.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{} = truck} = Unit.update_truck(truck, @update_attrs)
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Unit.update_truck(truck, @invalid_attrs)
      assert truck == Unit.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = Unit.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> Unit.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = Unit.change_truck(truck)
    end
  end

  describe "trucks" do
    alias TmsApi.Unit.Truck

    @valid_attrs %{kir_file: "some kir_file", license_number: "some license_number", license_type: "some license_type", production_year: 42, status: true, stnk_file: "some stnk_file", truck_type: "some truck_type"}
    @update_attrs %{kir_file: "some updated kir_file", license_number: "some updated license_number", license_type: "some updated license_type", production_year: 43, status: false, stnk_file: "some updated stnk_file", truck_type: "some updated truck_type"}
    @invalid_attrs %{kir_file: nil, license_number: nil, license_type: nil, production_year: nil, status: nil, stnk_file: nil, truck_type: nil}

    def truck_fixture(attrs \\ %{}) do
      {:ok, truck} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Unit.create_truck()

      truck
    end

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert Unit.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert Unit.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      assert {:ok, %Truck{} = truck} = Unit.create_truck(@valid_attrs)
      assert truck.kir_file == "some kir_file"
      assert truck.license_number == "some license_number"
      assert truck.license_type == "some license_type"
      assert truck.production_year == 42
      assert truck.status == true
      assert truck.stnk_file == "some stnk_file"
      assert truck.truck_type == "some truck_type"
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Unit.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{} = truck} = Unit.update_truck(truck, @update_attrs)
      assert truck.kir_file == "some updated kir_file"
      assert truck.license_number == "some updated license_number"
      assert truck.license_type == "some updated license_type"
      assert truck.production_year == 43
      assert truck.status == false
      assert truck.stnk_file == "some updated stnk_file"
      assert truck.truck_type == "some updated truck_type"
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Unit.update_truck(truck, @invalid_attrs)
      assert truck == Unit.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = Unit.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> Unit.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = Unit.change_truck(truck)
    end
  end
end

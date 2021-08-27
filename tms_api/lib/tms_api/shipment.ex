defmodule TmsApi.Shipment do
  @moduledoc """
  The Shipment context.
  """

  import Ecto.Query, warn: false
  alias TmsApi.Repo

  alias TmsApi.Shipment.ShipmentList

  @doc """
  Returns the list of shipmentlist.

  ## Examples

      iex> list_shipmentlist()
      [%ShipmentList{}, ...]

  """
  def list_shipmentlist do
    Repo.all(ShipmentList)
  end

  @doc """
  Gets a single shipment_list.

  Raises `Ecto.NoResultsError` if the Shipment list does not exist.

  ## Examples

      iex> get_shipment_list!(123)
      %ShipmentList{}

      iex> get_shipment_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shipment_list!(id), do: Repo.get!(ShipmentList, id)

  @doc """
  Creates a shipment_list.

  ## Examples

      iex> create_shipment_list(%{field: value})
      {:ok, %ShipmentList{}}

      iex> create_shipment_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shipment_list(attrs \\ %{}) do
    %ShipmentList{}
    |> ShipmentList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shipment_list.

  ## Examples

      iex> update_shipment_list(shipment_list, %{field: new_value})
      {:ok, %ShipmentList{}}

      iex> update_shipment_list(shipment_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shipment_list(%ShipmentList{} = shipment_list, attrs) do
    shipment_list
    |> ShipmentList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shipment_list.

  ## Examples

      iex> delete_shipment_list(shipment_list)
      {:ok, %ShipmentList{}}

      iex> delete_shipment_list(shipment_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shipment_list(%ShipmentList{} = shipment_list) do
    Repo.delete(shipment_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shipment_list changes.

  ## Examples

      iex> change_shipment_list(shipment_list)
      %Ecto.Changeset{data: %ShipmentList{}}

  """
  def change_shipment_list(%ShipmentList{} = shipment_list, attrs \\ %{}) do
    ShipmentList.changeset(shipment_list, attrs)
  end
end

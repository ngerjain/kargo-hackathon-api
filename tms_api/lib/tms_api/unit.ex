defmodule TmsApi.Unit do
  @moduledoc """
  The Unit context.
  """

  import Ecto.Query, warn: false
  alias TmsApi.Repo
  alias TmsApi.Unit.Truck

  @doc """
  Returns the list of trucks.

  ## Examples

      iex> list_trucks()
      [%Truck{}, ...]

  """
  def list_trucks do
    Repo.all(Truck)
  end

  @doc """
  Gets a single truck.

  Raises `Ecto.NoResultsError` if the Truck does not exist.

  ## Examples

      iex> get_truck!(123)
      %Truck{}

      iex> get_truck!(456)
      ** (Ecto.NoResultsError)

  """
  def get_truck!(id), do: Repo.get!(Truck, id)

  @doc """
  Creates a truck.

  ## Examples

      iex> create_truck(%{field: value})
      {:ok, %Truck{}}

      iex> create_truck(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_truck(attrs \\ %{}) do
    %Truck{}
    |> Truck.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a truck.

  ## Examples

      iex> update_truck(truck, %{field: new_value})
      {:ok, %Truck{}}

      iex> update_truck(truck, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_truck(%Truck{} = truck, attrs) do
    truck
    |> Truck.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a truck.

  ## Examples

      iex> delete_truck(truck)
      {:ok, %Truck{}}

      iex> delete_truck(truck)
      {:error, %Ecto.Changeset{}}

  """
  def delete_truck(%Truck{} = truck) do
    Repo.delete(truck)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking truck changes.

  ## Examples

      iex> change_truck(truck)
      %Ecto.Changeset{data: %Truck{}}

  """
  def change_truck(%Truck{} = truck, attrs \\ %{}) do
    Truck.changeset(truck, attrs)
  end
end

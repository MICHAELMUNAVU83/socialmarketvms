defmodule Socialmarketvms.EventCategories do
  @moduledoc """
  The EventCategories context.
  """

  import Ecto.Query, warn: false
  alias Socialmarketvms.Repo

  alias Socialmarketvms.EventCategories.EventCategory

  @doc """
  Returns the list of event_categories.

  ## Examples

      iex> list_event_categories()
      [%EventCategory{}, ...]

  """
  def list_event_categories do
    Repo.all(EventCategory)
  end

  @doc """
  Gets a single event_category.

  Raises `Ecto.NoResultsError` if the Event category does not exist.

  ## Examples

      iex> get_event_category!(123)
      %EventCategory{}

      iex> get_event_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event_category!(id), do: Repo.get!(EventCategory, id)

  @doc """
  Creates a event_category.

  ## Examples

      iex> create_event_category(%{field: value})
      {:ok, %EventCategory{}}

      iex> create_event_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event_category(attrs \\ %{}) do
    %EventCategory{}
    |> EventCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event_category.

  ## Examples

      iex> update_event_category(event_category, %{field: new_value})
      {:ok, %EventCategory{}}

      iex> update_event_category(event_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event_category(%EventCategory{} = event_category, attrs) do
    event_category
    |> EventCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a event_category.

  ## Examples

      iex> delete_event_category(event_category)
      {:ok, %EventCategory{}}

      iex> delete_event_category(event_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event_category(%EventCategory{} = event_category) do
    Repo.delete(event_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event_category changes.

  ## Examples

      iex> change_event_category(event_category)
      %Ecto.Changeset{data: %EventCategory{}}

  """
  def change_event_category(%EventCategory{} = event_category, attrs \\ %{}) do
    EventCategory.changeset(event_category, attrs)
  end
end

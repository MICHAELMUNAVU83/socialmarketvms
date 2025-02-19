defmodule Socialmarketvms.DefaultCategories do
  @moduledoc """
  The DefaultCategories context.
  """

  import Ecto.Query, warn: false
  alias Socialmarketvms.Repo

  alias Socialmarketvms.DefaultCategories.DefaultCategory

  @doc """
  Returns the list of default_categories.

  ## Examples

      iex> list_default_categories()
      [%DefaultCategory{}, ...]

  """
  def list_default_categories do
    Repo.all(DefaultCategory)
  end

  @doc """
  Gets a single default_category.

  Raises `Ecto.NoResultsError` if the Default category does not exist.

  ## Examples

      iex> get_default_category!(123)
      %DefaultCategory{}

      iex> get_default_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_default_category!(id), do: Repo.get!(DefaultCategory, id)

  @doc """
  Creates a default_category.

  ## Examples

      iex> create_default_category(%{field: value})
      {:ok, %DefaultCategory{}}

      iex> create_default_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_default_category(attrs \\ %{}) do
    %DefaultCategory{}
    |> DefaultCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a default_category.

  ## Examples

      iex> update_default_category(default_category, %{field: new_value})
      {:ok, %DefaultCategory{}}

      iex> update_default_category(default_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_default_category(%DefaultCategory{} = default_category, attrs) do
    default_category
    |> DefaultCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a default_category.

  ## Examples

      iex> delete_default_category(default_category)
      {:ok, %DefaultCategory{}}

      iex> delete_default_category(default_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_default_category(%DefaultCategory{} = default_category) do
    Repo.delete(default_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking default_category changes.

  ## Examples

      iex> change_default_category(default_category)
      %Ecto.Changeset{data: %DefaultCategory{}}

  """
  def change_default_category(%DefaultCategory{} = default_category, attrs \\ %{}) do
    DefaultCategory.changeset(default_category, attrs)
  end
end

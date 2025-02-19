defmodule Socialmarketvms.DefaultCategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Socialmarketvms.DefaultCategories` context.
  """

  @doc """
  Generate a default_category.
  """
  def default_category_fixture(attrs \\ %{}) do
    {:ok, default_category} =
      attrs
      |> Enum.into(%{
        amenities: "some amenities",
        description: "some description",
        image: "some image",
        name: "some name",
        price: 42,
        units_available: 42
      })
      |> Socialmarketvms.DefaultCategories.create_default_category()

    default_category
  end
end

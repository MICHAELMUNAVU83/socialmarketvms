defmodule Socialmarketvms.EventCategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Socialmarketvms.EventCategories` context.
  """

  @doc """
  Generate a event_category.
  """
  def event_category_fixture(attrs \\ %{}) do
    {:ok, event_category} =
      attrs
      |> Enum.into(%{
        amenities: "some amenities",
        description: "some description",
        image: "some image",
        name: "some name",
        price: 42,
        units_available: 42
      })
      |> Socialmarketvms.EventCategories.create_event_category()

    event_category
  end
end

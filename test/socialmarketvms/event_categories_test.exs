defmodule Socialmarketvms.EventCategoriesTest do
  use Socialmarketvms.DataCase

  alias Socialmarketvms.EventCategories

  describe "event_categories" do
    alias Socialmarketvms.EventCategories.EventCategory

    import Socialmarketvms.EventCategoriesFixtures

    @invalid_attrs %{name: nil, description: nil, image: nil, price: nil, units_available: nil, amenities: nil}

    test "list_event_categories/0 returns all event_categories" do
      event_category = event_category_fixture()
      assert EventCategories.list_event_categories() == [event_category]
    end

    test "get_event_category!/1 returns the event_category with given id" do
      event_category = event_category_fixture()
      assert EventCategories.get_event_category!(event_category.id) == event_category
    end

    test "create_event_category/1 with valid data creates a event_category" do
      valid_attrs = %{name: "some name", description: "some description", image: "some image", price: 42, units_available: 42, amenities: "some amenities"}

      assert {:ok, %EventCategory{} = event_category} = EventCategories.create_event_category(valid_attrs)
      assert event_category.name == "some name"
      assert event_category.description == "some description"
      assert event_category.image == "some image"
      assert event_category.price == 42
      assert event_category.units_available == 42
      assert event_category.amenities == "some amenities"
    end

    test "create_event_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EventCategories.create_event_category(@invalid_attrs)
    end

    test "update_event_category/2 with valid data updates the event_category" do
      event_category = event_category_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", image: "some updated image", price: 43, units_available: 43, amenities: "some updated amenities"}

      assert {:ok, %EventCategory{} = event_category} = EventCategories.update_event_category(event_category, update_attrs)
      assert event_category.name == "some updated name"
      assert event_category.description == "some updated description"
      assert event_category.image == "some updated image"
      assert event_category.price == 43
      assert event_category.units_available == 43
      assert event_category.amenities == "some updated amenities"
    end

    test "update_event_category/2 with invalid data returns error changeset" do
      event_category = event_category_fixture()
      assert {:error, %Ecto.Changeset{}} = EventCategories.update_event_category(event_category, @invalid_attrs)
      assert event_category == EventCategories.get_event_category!(event_category.id)
    end

    test "delete_event_category/1 deletes the event_category" do
      event_category = event_category_fixture()
      assert {:ok, %EventCategory{}} = EventCategories.delete_event_category(event_category)
      assert_raise Ecto.NoResultsError, fn -> EventCategories.get_event_category!(event_category.id) end
    end

    test "change_event_category/1 returns a event_category changeset" do
      event_category = event_category_fixture()
      assert %Ecto.Changeset{} = EventCategories.change_event_category(event_category)
    end
  end
end

defmodule Socialmarketvms.DefaultCategoriesTest do
  use Socialmarketvms.DataCase

  alias Socialmarketvms.DefaultCategories

  describe "default_categories" do
    alias Socialmarketvms.DefaultCategories.DefaultCategory

    import Socialmarketvms.DefaultCategoriesFixtures

    @invalid_attrs %{name: nil, description: nil, image: nil, price: nil, units_available: nil, amenities: nil}

    test "list_default_categories/0 returns all default_categories" do
      default_category = default_category_fixture()
      assert DefaultCategories.list_default_categories() == [default_category]
    end

    test "get_default_category!/1 returns the default_category with given id" do
      default_category = default_category_fixture()
      assert DefaultCategories.get_default_category!(default_category.id) == default_category
    end

    test "create_default_category/1 with valid data creates a default_category" do
      valid_attrs = %{name: "some name", description: "some description", image: "some image", price: 42, units_available: 42, amenities: "some amenities"}

      assert {:ok, %DefaultCategory{} = default_category} = DefaultCategories.create_default_category(valid_attrs)
      assert default_category.name == "some name"
      assert default_category.description == "some description"
      assert default_category.image == "some image"
      assert default_category.price == 42
      assert default_category.units_available == 42
      assert default_category.amenities == "some amenities"
    end

    test "create_default_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DefaultCategories.create_default_category(@invalid_attrs)
    end

    test "update_default_category/2 with valid data updates the default_category" do
      default_category = default_category_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", image: "some updated image", price: 43, units_available: 43, amenities: "some updated amenities"}

      assert {:ok, %DefaultCategory{} = default_category} = DefaultCategories.update_default_category(default_category, update_attrs)
      assert default_category.name == "some updated name"
      assert default_category.description == "some updated description"
      assert default_category.image == "some updated image"
      assert default_category.price == 43
      assert default_category.units_available == 43
      assert default_category.amenities == "some updated amenities"
    end

    test "update_default_category/2 with invalid data returns error changeset" do
      default_category = default_category_fixture()
      assert {:error, %Ecto.Changeset{}} = DefaultCategories.update_default_category(default_category, @invalid_attrs)
      assert default_category == DefaultCategories.get_default_category!(default_category.id)
    end

    test "delete_default_category/1 deletes the default_category" do
      default_category = default_category_fixture()
      assert {:ok, %DefaultCategory{}} = DefaultCategories.delete_default_category(default_category)
      assert_raise Ecto.NoResultsError, fn -> DefaultCategories.get_default_category!(default_category.id) end
    end

    test "change_default_category/1 returns a default_category changeset" do
      default_category = default_category_fixture()
      assert %Ecto.Changeset{} = DefaultCategories.change_default_category(default_category)
    end
  end
end

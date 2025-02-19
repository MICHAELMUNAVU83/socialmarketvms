defmodule SocialmarketvmsWeb.DefaultCategoryLiveTest do
  use SocialmarketvmsWeb.ConnCase

  import Phoenix.LiveViewTest
  import Socialmarketvms.DefaultCategoriesFixtures

  @create_attrs %{name: "some name", description: "some description", image: "some image", price: 42, units_available: 42, amenities: "some amenities"}
  @update_attrs %{name: "some updated name", description: "some updated description", image: "some updated image", price: 43, units_available: 43, amenities: "some updated amenities"}
  @invalid_attrs %{name: nil, description: nil, image: nil, price: nil, units_available: nil, amenities: nil}

  defp create_default_category(_) do
    default_category = default_category_fixture()
    %{default_category: default_category}
  end

  describe "Index" do
    setup [:create_default_category]

    test "lists all default_categories", %{conn: conn, default_category: default_category} do
      {:ok, _index_live, html} = live(conn, ~p"/default_categories")

      assert html =~ "Listing Default categories"
      assert html =~ default_category.name
    end

    test "saves new default_category", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/default_categories")

      assert index_live |> element("a", "New Default category") |> render_click() =~
               "New Default category"

      assert_patch(index_live, ~p"/default_categories/new")

      assert index_live
             |> form("#default_category-form", default_category: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#default_category-form", default_category: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/default_categories")

      html = render(index_live)
      assert html =~ "Default category created successfully"
      assert html =~ "some name"
    end

    test "updates default_category in listing", %{conn: conn, default_category: default_category} do
      {:ok, index_live, _html} = live(conn, ~p"/default_categories")

      assert index_live |> element("#default_categories-#{default_category.id} a", "Edit") |> render_click() =~
               "Edit Default category"

      assert_patch(index_live, ~p"/default_categories/#{default_category}/edit")

      assert index_live
             |> form("#default_category-form", default_category: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#default_category-form", default_category: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/default_categories")

      html = render(index_live)
      assert html =~ "Default category updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes default_category in listing", %{conn: conn, default_category: default_category} do
      {:ok, index_live, _html} = live(conn, ~p"/default_categories")

      assert index_live |> element("#default_categories-#{default_category.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#default_categories-#{default_category.id}")
    end
  end

  describe "Show" do
    setup [:create_default_category]

    test "displays default_category", %{conn: conn, default_category: default_category} do
      {:ok, _show_live, html} = live(conn, ~p"/default_categories/#{default_category}")

      assert html =~ "Show Default category"
      assert html =~ default_category.name
    end

    test "updates default_category within modal", %{conn: conn, default_category: default_category} do
      {:ok, show_live, _html} = live(conn, ~p"/default_categories/#{default_category}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Default category"

      assert_patch(show_live, ~p"/default_categories/#{default_category}/show/edit")

      assert show_live
             |> form("#default_category-form", default_category: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#default_category-form", default_category: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/default_categories/#{default_category}")

      html = render(show_live)
      assert html =~ "Default category updated successfully"
      assert html =~ "some updated name"
    end
  end
end

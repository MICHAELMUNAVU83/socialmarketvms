defmodule SocialmarketvmsWeb.EventCategoryLiveTest do
  use SocialmarketvmsWeb.ConnCase

  import Phoenix.LiveViewTest
  import Socialmarketvms.EventCategoriesFixtures

  @create_attrs %{name: "some name", description: "some description", image: "some image", price: 42, units_available: 42, amenities: "some amenities"}
  @update_attrs %{name: "some updated name", description: "some updated description", image: "some updated image", price: 43, units_available: 43, amenities: "some updated amenities"}
  @invalid_attrs %{name: nil, description: nil, image: nil, price: nil, units_available: nil, amenities: nil}

  defp create_event_category(_) do
    event_category = event_category_fixture()
    %{event_category: event_category}
  end

  describe "Index" do
    setup [:create_event_category]

    test "lists all event_categories", %{conn: conn, event_category: event_category} do
      {:ok, _index_live, html} = live(conn, ~p"/event_categories")

      assert html =~ "Listing Event categories"
      assert html =~ event_category.name
    end

    test "saves new event_category", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/event_categories")

      assert index_live |> element("a", "New Event category") |> render_click() =~
               "New Event category"

      assert_patch(index_live, ~p"/event_categories/new")

      assert index_live
             |> form("#event_category-form", event_category: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#event_category-form", event_category: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/event_categories")

      html = render(index_live)
      assert html =~ "Event category created successfully"
      assert html =~ "some name"
    end

    test "updates event_category in listing", %{conn: conn, event_category: event_category} do
      {:ok, index_live, _html} = live(conn, ~p"/event_categories")

      assert index_live |> element("#event_categories-#{event_category.id} a", "Edit") |> render_click() =~
               "Edit Event category"

      assert_patch(index_live, ~p"/event_categories/#{event_category}/edit")

      assert index_live
             |> form("#event_category-form", event_category: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#event_category-form", event_category: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/event_categories")

      html = render(index_live)
      assert html =~ "Event category updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes event_category in listing", %{conn: conn, event_category: event_category} do
      {:ok, index_live, _html} = live(conn, ~p"/event_categories")

      assert index_live |> element("#event_categories-#{event_category.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#event_categories-#{event_category.id}")
    end
  end

  describe "Show" do
    setup [:create_event_category]

    test "displays event_category", %{conn: conn, event_category: event_category} do
      {:ok, _show_live, html} = live(conn, ~p"/event_categories/#{event_category}")

      assert html =~ "Show Event category"
      assert html =~ event_category.name
    end

    test "updates event_category within modal", %{conn: conn, event_category: event_category} do
      {:ok, show_live, _html} = live(conn, ~p"/event_categories/#{event_category}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Event category"

      assert_patch(show_live, ~p"/event_categories/#{event_category}/show/edit")

      assert show_live
             |> form("#event_category-form", event_category: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#event_category-form", event_category: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/event_categories/#{event_category}")

      html = render(show_live)
      assert html =~ "Event category updated successfully"
      assert html =~ "some updated name"
    end
  end
end

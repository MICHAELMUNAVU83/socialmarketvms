defmodule SocialmarketvmsWeb.DefaultCategoryLive.Index do
  use SocialmarketvmsWeb, :system_live_view

  alias Socialmarketvms.DefaultCategories
  alias Socialmarketvms.DefaultCategories.DefaultCategory

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:active_tab, :default_categories)
     |> stream(:default_categories, DefaultCategories.list_default_categories())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Default category")
    |> assign(:default_category, DefaultCategories.get_default_category!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Default category")
    |> assign(:default_category, %DefaultCategory{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Default categories")
    |> assign(:default_category, nil)
  end

  @impl true
  def handle_info(
        {SocialmarketvmsWeb.DefaultCategoryLive.FormComponent, {:saved, default_category}},
        socket
      ) do
    {:noreply, stream_insert(socket, :default_categories, default_category)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    default_category = DefaultCategories.get_default_category!(id)
    {:ok, _} = DefaultCategories.delete_default_category(default_category)

    {:noreply, stream_delete(socket, :default_categories, default_category)}
  end
end

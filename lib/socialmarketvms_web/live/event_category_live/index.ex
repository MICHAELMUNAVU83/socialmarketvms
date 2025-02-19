defmodule SocialmarketvmsWeb.EventCategoryLive.Index do
  use SocialmarketvmsWeb, :live_view

  alias Socialmarketvms.EventCategories
  alias Socialmarketvms.EventCategories.EventCategory

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :event_categories, EventCategories.list_event_categories())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Event category")
    |> assign(:event_category, EventCategories.get_event_category!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Event category")
    |> assign(:event_category, %EventCategory{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Event categories")
    |> assign(:event_category, nil)
  end

  @impl true
  def handle_info({SocialmarketvmsWeb.EventCategoryLive.FormComponent, {:saved, event_category}}, socket) do
    {:noreply, stream_insert(socket, :event_categories, event_category)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    event_category = EventCategories.get_event_category!(id)
    {:ok, _} = EventCategories.delete_event_category(event_category)

    {:noreply, stream_delete(socket, :event_categories, event_category)}
  end
end

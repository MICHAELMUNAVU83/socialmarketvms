defmodule SocialmarketvmsWeb.EventCategoryLive.Show do
  use SocialmarketvmsWeb, :live_view

  alias Socialmarketvms.EventCategories

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:event_category, EventCategories.get_event_category!(id))}
  end

  defp page_title(:show), do: "Show Event category"
  defp page_title(:edit), do: "Edit Event category"
end

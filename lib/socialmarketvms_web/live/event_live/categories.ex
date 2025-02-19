defmodule SocialmarketvmsWeb.EventLive.Categories do
  use SocialmarketvmsWeb, :system_live_view

  alias Socialmarketvms.Events

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:active_tab, :events)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, "Categores")
     |> assign(:event, Events.get_event!(id))}
  end

  def render(assigns) do
    ~H"""
    <div></div>
    """
  end
end

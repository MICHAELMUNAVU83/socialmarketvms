defmodule SocialmarketvmsWeb.LandingPageLive.Index do
  use SocialmarketvmsWeb, :live_view
  alias Socialmarketvms.Events

  @impl true
  def mount(_, _, socket) do
    {:ok,
     socket
     |> assign(:events, Events.active_events())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-[100%] flex flex-col gap-4">
      <p>
        Events
      </p>

      <div class="w-[100%] grid grid-cols-3 gap-8">
        <%= for event <- @events do %>
          <div class="w-[100%] hover:bg-white p-2 hover:shadow-sm shadow-gray-500 rounded-md flex flex-col gap-2">
            <img src={event.image} class="h-[350px] rounded-md w-[100%] object-cover" />
            <b>
              {event.name}
            </b>

            <b>
              {event.date}
            </b>
            <p>
              {event.location}
            </p>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end

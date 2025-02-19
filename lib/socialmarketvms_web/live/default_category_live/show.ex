defmodule SocialmarketvmsWeb.DefaultCategoryLive.Show do
  use SocialmarketvmsWeb, :system_live_view

  alias Socialmarketvms.DefaultCategories

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:active_tab, :default_categories)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:default_category, DefaultCategories.get_default_category!(id))}
  end

  defp page_title(:show), do: "Show Default category"
  defp page_title(:edit), do: "Edit Default category"
end

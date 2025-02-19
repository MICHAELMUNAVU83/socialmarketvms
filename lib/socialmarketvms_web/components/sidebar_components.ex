defmodule Socialmarketvms.SidebarComponents do
  use Phoenix.Component

  def sidebar(assigns) do
    ~H"""
    <aside
      id="sidebar-multi-level-sidebar"
      class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full md:translate-x-0"
      aria-label="Sidebar"
    >
      <div class="h-full cursor-pointer px-3 py-4 overflow-y-auto bg-[#8134AF]">
        <ul class="space-y-2 cursor-pointer font-medium">
          <%= for tab <- tabs() do %>
            <.sidebar_card tab={tab} active_tab={@active_tab} />
          <% end %>
          <li>
            <.link
              href="/users/log_out"
              method="delete"
              class="flex items-center p-2  rounded-lg  text-white   hover:bg-white hover:text-black group"
            >
              <Heroicons.icon name="arrow-left-start-on-rectangle" type="outline" class="h-4 w-4" />
              <span class="flex-1 ms-3 whitespace-nowrap">Sign Out</span>
            </.link>
          </li>
        </ul>
      </div>
    </aside>
    """
  end

  def sidebar_card(assigns) do
    ~H"""
    <li>
      <a
        href={@tab.url}
        class={"#{if @active_tab == @tab.tab_name do "bg-white text-black" else "text-white" end} flex items-center p-2  rounded-lg cursor-pointer   hover:bg-white hover:text-black group"}
      >
        <Heroicons.icon name={@tab.icon} type="outline" class="h-4 w-4" />
        <span class="flex-1 ms-3 whitespace-nowrap">{@tab.name}</span>
      </a>
    </li>
    """
  end

  defp tabs do
    [
      %{
        name: "Dashboard",
        icon: "home",
        url: "/dashboard",
        tab_name: :dashboard
      },
      %{
        name: "Events",
        icon: "briefcase",
        url: "/events",
        tab_name: :events
      },
      %{
        name: "Default Categories",
        icon: "cog",
        url: "/default_categories",
        tab_name: :settings
      },
      %{
        name: "Users",
        icon: "cog",
        url: "/settings",
        tab_name: :settings
      }
    ]
  end
end

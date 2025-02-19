defmodule SocialmarketvmsWeb.EventCategoryLive.FormComponent do
  use SocialmarketvmsWeb, :live_component

  alias Socialmarketvms.EventCategories

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage event_category records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="event_category-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:description]} type="text" label="Description" />
        <.input field={@form[:price]} type="number" label="Price" />
        <.input field={@form[:image]} type="text" label="Image" />
        <.input field={@form[:units_available]} type="number" label="Units available" />
        <.input field={@form[:amenities]} type="text" label="Amenities" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Event category</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{event_category: event_category} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(EventCategories.change_event_category(event_category))
     end)}
  end

  @impl true
  def handle_event("validate", %{"event_category" => event_category_params}, socket) do
    changeset = EventCategories.change_event_category(socket.assigns.event_category, event_category_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"event_category" => event_category_params}, socket) do
    save_event_category(socket, socket.assigns.action, event_category_params)
  end

  defp save_event_category(socket, :edit, event_category_params) do
    case EventCategories.update_event_category(socket.assigns.event_category, event_category_params) do
      {:ok, event_category} ->
        notify_parent({:saved, event_category})

        {:noreply,
         socket
         |> put_flash(:info, "Event category updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_event_category(socket, :new, event_category_params) do
    case EventCategories.create_event_category(event_category_params) do
      {:ok, event_category} ->
        notify_parent({:saved, event_category})

        {:noreply,
         socket
         |> put_flash(:info, "Event category created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end

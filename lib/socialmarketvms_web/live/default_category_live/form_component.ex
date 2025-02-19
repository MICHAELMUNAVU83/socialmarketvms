defmodule SocialmarketvmsWeb.DefaultCategoryLive.FormComponent do
  use SocialmarketvmsWeb, :live_component

  alias Socialmarketvms.DefaultCategories

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
      </.header>

      <.simple_form
        for={@form}
        id="default_category-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:description]} type="textarea" label="Description" />
        <.input field={@form[:price]} type="number" label="Price" />
        <.input field={@form[:image]} type="text" label="Image" />
        <.input field={@form[:units_available]} type="number" label="Units available" />
        <.input field={@form[:amenities]} type="textarea" label="Amenities" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Default category</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{default_category: default_category} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(DefaultCategories.change_default_category(default_category))
     end)}
  end

  @impl true
  def handle_event("validate", %{"default_category" => default_category_params}, socket) do
    changeset =
      DefaultCategories.change_default_category(
        socket.assigns.default_category,
        default_category_params
      )

    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"default_category" => default_category_params}, socket) do
    save_default_category(socket, socket.assigns.action, default_category_params)
  end

  defp save_default_category(socket, :edit, default_category_params) do
    case DefaultCategories.update_default_category(
           socket.assigns.default_category,
           default_category_params
         ) do
      {:ok, default_category} ->
        notify_parent({:saved, default_category})

        {:noreply,
         socket
         |> put_flash(:info, "Default category updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_default_category(socket, :new, default_category_params) do
    case DefaultCategories.create_default_category(default_category_params) do
      {:ok, default_category} ->
        notify_parent({:saved, default_category})

        {:noreply,
         socket
         |> put_flash(:info, "Default category created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end

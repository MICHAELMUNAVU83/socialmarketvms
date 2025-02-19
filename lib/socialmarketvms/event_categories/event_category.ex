defmodule Socialmarketvms.EventCategories.EventCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "event_categories" do
    field :name, :string
    field :description, :string
    field :image, :string
    field :price, :integer
    field :units_available, :integer
    field :amenities, :string
    field :user_id, :id
    field :event_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event_category, attrs) do
    event_category
    |> cast(attrs, [:name, :description, :price, :image, :units_available, :amenities])
    |> validate_required([:name, :description, :price, :image, :units_available, :amenities])
  end
end

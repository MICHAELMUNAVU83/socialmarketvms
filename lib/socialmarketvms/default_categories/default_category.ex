defmodule Socialmarketvms.DefaultCategories.DefaultCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "default_categories" do
    field :name, :string
    field :description, :string
    field :image, :string
    field :price, :integer
    field :units_available, :integer
    field :amenities, :string
    belongs_to(:user, Socialmarketvms.Accounts.User)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(default_category, attrs) do
    default_category
    |> cast(attrs, [:name, :description, :price, :image, :units_available, :amenities, :user_id])
    |> validate_required([
      :name,
      :description,
      :price,
      :image,
      :units_available,
      :amenities,
      :user_id
    ])
  end
end

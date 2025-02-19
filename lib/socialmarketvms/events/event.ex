defmodule Socialmarketvms.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :name, :string
    field :date, :date
    field :description, :string
    field :location, :string
    field :start_time, :time
    field :image, :string
    belongs_to(:user, Socialmarketvms.Accounts.User)
    field :is_active, :boolean, default: true

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [
      :name,
      :description,
      :date,
      :start_time,
      :location,
      :is_active,
      :user_id,
      :image
    ])
    |> validate_required([
      :name,
      :description,
      :date,
      :start_time,
      :location,
      :is_active,
      :user_id
    ])
  end
end

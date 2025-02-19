defmodule Socialmarketvms.Repo.Migrations.CreateEventCategories do
  use Ecto.Migration

  def change do
    create table(:event_categories) do
      add :name, :string
      add :description, :text
      add :price, :integer
      add :image, :text
      add :units_available, :integer
      add :amenities, :text
      add :user_id, references(:users, on_delete: :nothing)
      add :event_id, references(:events, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:event_categories, [:user_id])
    create index(:event_categories, [:event_id])
  end
end

defmodule Socialmarketvms.Repo.Migrations.CreateDefaultCategories do
  use Ecto.Migration

  def change do
    create table(:default_categories) do
      add :name, :string
      add :description, :text
      add :price, :integer
      add :image, :text
      add :units_available, :integer
      add :amenities, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:default_categories, [:user_id])
  end
end

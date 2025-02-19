defmodule Socialmarketvms.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :description, :text
      add :date, :date
      add :image, :text
      add :start_time, :time
      add :location, :string
      add :is_active, :boolean, default: true
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:events, [:user_id])
  end
end

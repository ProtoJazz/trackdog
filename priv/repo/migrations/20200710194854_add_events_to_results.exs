defmodule Trackdog.Repo.Migrations.AddEventsToResults do
  use Ecto.Migration

  def change do
    alter table(:results) do
      add :event_id, references(:events, on_delete: :nothing)

    end

  end
end

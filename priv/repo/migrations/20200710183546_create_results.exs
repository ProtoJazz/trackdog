defmodule Trackdog.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :event_id, :integer
      add :result_entries, :integer

      timestamps()
    end

  end
end

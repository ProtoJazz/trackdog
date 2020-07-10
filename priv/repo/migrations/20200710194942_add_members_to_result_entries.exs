defmodule Trackdog.Repo.Migrations.AddMembersToResultEntries do
  use Ecto.Migration

  def change do
    alter table(:result_entries) do
      add :member_id, references(:members, on_delete: :nothing)

    end
  end
end

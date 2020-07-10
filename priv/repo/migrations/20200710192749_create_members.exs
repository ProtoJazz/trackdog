defmodule Trackdog.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:members, [:user_id])
  end
end

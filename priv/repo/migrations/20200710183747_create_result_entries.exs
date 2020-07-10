defmodule Trackdog.Repo.Migrations.CreateResultEntries do
  use Ecto.Migration

  def change do
    create table(:result_entries) do
      add :start, :integer
      add :finish, :integer
      add :points, :integer
      add :result_id, references(:results, on_delete: :nothing)


      timestamps()
    end

  end
end

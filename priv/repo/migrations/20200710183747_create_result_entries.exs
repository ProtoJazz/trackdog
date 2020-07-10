defmodule Trackdog.Repo.Migrations.CreateResultEntries do
  use Ecto.Migration

  def change do
    create table(:result_entries) do
      add :start, :integer
      add :finish, :integer
      add :points, :integer
      add :driver, :integer
      add :result, :integer

      timestamps()
    end

  end
end

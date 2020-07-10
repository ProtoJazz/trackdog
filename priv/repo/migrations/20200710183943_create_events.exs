defmodule Trackdog.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :date, :utc_datetime
      add :track, :string
      add :result_id, references(:results, on_delete: :nothing)

      timestamps()
    end

  end
end

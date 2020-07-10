defmodule Trackdog.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      timestamps()
    end

  end
end

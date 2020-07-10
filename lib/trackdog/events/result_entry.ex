defmodule Trackdog.Events.ResultEntry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "result_entries" do
    field :driver, :integer
    field :finish, :integer
    field :points, :integer
    field :result, :integer
    field :start, :integer

    timestamps()
  end

  @doc false
  def changeset(result_entry, attrs) do
    result_entry
    |> cast(attrs, [:start, :finish, :points, :driver, :result])
    |> validate_required([:start, :finish, :points, :driver, :result])
  end
end

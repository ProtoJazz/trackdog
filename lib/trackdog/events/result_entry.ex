defmodule Trackdog.Events.ResultEntry do
  use Ecto.Schema
  import Ecto.Changeset
  alias Trackdog.Events.Result
  alias Trackdog.Members.Member
  schema "result_entries" do
    belongs_to :driver, Member
    field :finish, :integer
    field :points, :integer
    belongs_to :result, Result
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

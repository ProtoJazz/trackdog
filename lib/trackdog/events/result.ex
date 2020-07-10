defmodule Trackdog.Events.Result do
  use Ecto.Schema
  import Ecto.Changeset
  alias Trackdog.Events.ResultEntry
  alias Trackdog.Events.Event
  schema "results" do
    belongs_to :event, Event
    has_many :result_entries, ResultEntry
    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:event_id, :result_entries])
    |> validate_required([:event_id, :result_entries])
  end
end

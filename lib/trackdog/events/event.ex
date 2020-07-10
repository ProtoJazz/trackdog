defmodule Trackdog.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias Trackdog.Events.Result
  schema "events" do
    field :date, :utc_datetime
    field :track, :string
    has_one :result, Result
    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:date, :track])
    |> validate_required([:date, :track])
  end
end

defmodule Trackdog.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :date, :utc_datetime
    field :result, :integer
    field :track, :string

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:date, :track, :result])
    |> validate_required([:date, :track, :result])
  end
end

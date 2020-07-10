defmodule Trackdog.Events.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field :event_id, :integer
    field :result_entries, :integer

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:event_id, :result_entries])
    |> validate_required([:event_id, :result_entries])
  end
end

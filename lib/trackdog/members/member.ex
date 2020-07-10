defmodule Trackdog.Members.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :results, :integer
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:results])
    |> validate_required([:results])
  end
end

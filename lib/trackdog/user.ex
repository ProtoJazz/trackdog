defmodule Trackdog.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Trackdog.Members.Member
  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_one :member, Member
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end

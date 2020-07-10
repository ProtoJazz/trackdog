defmodule Trackdog.Repo do
  use Ecto.Repo,
    otp_app: :trackdog,
    adapter: Ecto.Adapters.Postgres
end

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :trackdog,
  ecto_repos: [Trackdog.Repo]

# Configures the endpoint
config :trackdog, TrackdogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2sGyeCU+IJ35/lgT6FqBWLg7eRTpiFsOV23mfw6VtnIpBXaWDPBXSlA5Bq2hLT5w",
  render_errors: [view: TrackdogWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Trackdog.PubSub,
  live_view: [signing_salt: "JXTs3BPa"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "email profile"]}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

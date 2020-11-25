# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :surface_repro,
  ecto_repos: [SurfaceRepro.Repo]

# Configures the endpoint
config :surface_repro, SurfaceReproWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lBvv2Qo4ML4s2igyeqRoSTDQ2t/jI2ZjTEIjtkH0MuHJWS1LpNdVLF51V0/hdLQb",
  render_errors: [view: SurfaceReproWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SurfaceRepro.PubSub,
  live_view: [signing_salt: "RrIWoSZ6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tms_api,
  ecto_repos: [TmsApi.Repo]

# Configures the endpoint
config :tms_api, TmsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "a4qMNwD7kSVayvC6BAOzQmBJneJ/Qf8dka9RNpoq2qwiHX/AAjHVT4gxu6NlhSsW",
  render_errors: [view: TmsApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TmsApi.PubSub,
  live_view: [signing_salt: "Us7m65uo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

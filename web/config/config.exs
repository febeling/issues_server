# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :web,
  namespace: PlapProp.Web

# Configures the endpoint
config :web, PlapProp.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sN1Cxr6AGoFemH3CtQUk0Pg+GszoppIL89lYaf+EqeFB+b5xIvueJyWtKxB+LOpW",
  render_errors: [view: PlapProp.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PlapProp.Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

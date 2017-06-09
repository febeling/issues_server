# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :web,
  namespace: PlanProp.Web

# Configures the endpoint
config :web, PlanProp.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1B8AaQKtmmiwhtBUcbnChOdY3JnfuWmEO4CidPBBLQKd3w7SCB6jOj0a0b/BrLLN",
  render_errors: [view: PlanProp.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PlanProp.Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id],
  handle_otp_reports: true,
  handle_sasl_reports: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elian,
  ecto_repos: [Elian.Repo]

# Configures the endpoint
config :elian, ElianWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CqD9/6gF8Ahi3U//9NpjaDNYgVYCcNbc6qQ2jLPvAuZSBKpnU7r8FGt9VJse3iuR",
  render_errors: [view: ElianWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Elian.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

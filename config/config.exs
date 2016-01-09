# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :critter4us, Critter4us.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "r2P74BRX1ZmeCnWdQE/mugP9BXO2KkmM8rP6YbQ5VRnnybwiEayg9Is9HGpCNERo",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Critter4us.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Openmaize authentication library configuration
config :openmaize,
  user_model: Critter4us.User,
  repo: Critter4us.Repo,
  redirect_pages: %{"admin" => "/", "requester" => "/", "superuser" => "/",
                    "logout" => "/login", "login" => "/login"}
  

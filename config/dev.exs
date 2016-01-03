use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :critter4us, Critter4us.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin"]]

# Watch static and templates for browser reloading.
config :critter4us, Critter4us.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :critter4us, Critter4us.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "marick",
  password: "still have TRUST",
  database: "elixir_critter4us_dev",
  hostname: "localhost",
  pool_size: 10

# Openmaize authentication library configuration
config :openmaize,
  user_model: Critter4us.User,
  repo: Critter4us.Repo,
  redirect_pages: %{"admin" => "/", "user" => "/",
                    nil => "/", "login" => "/login"}
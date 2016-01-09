use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :critter4us, Critter4us.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :critter4us, Critter4us.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "marick",
  password: "still have TRUST",
  database: "elixir_critter4us_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox


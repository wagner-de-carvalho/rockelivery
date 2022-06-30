import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rockelivery, Rockelivery.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "rockelivery_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :rockelivery, Rockelivery.Users.Create, via_cep_adapter: Rockelivery.ViaCep.ClientMock

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rockelivery, RockeliveryWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "uoU0EApd2wcf8tlRl8yLRvLRKn5hF/hMik02NhBZ3sXT7ThygSF2rG8fbt+kCyQ3",
  server: false

# In test we don't send emails.
config :rockelivery, Rockelivery.Mailer, adapter: Swoosh.Adapters.Test

# Encryption reduce the number of rounds.
config :pbkdf2_elixir, :rounds, 1

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

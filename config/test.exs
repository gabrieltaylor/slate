use Mix.Config

config :bcrypt_elixir, :log_rounds, 1

config :slate, Slate.Repo,
  username: "postgres",
  password: "postgres",
  database: "slate_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :slate, SlateWeb.Endpoint,
  http: [port: 4002],
  server: false

config :slate, Slate.Mailer, adapter: Bamboo.TestAdapter

config :logger, level: :warn

use Mix.Config

config :slate,
  ecto_repos: [Slate.Repo]

config :slate, SlateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6xyWpNiG/XgaFyExGmAQ8IltcYUts3EuRuut59PIOXDfzRvqqrt3mqIc/GlcujVg",
  render_errors: [view: SlateWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Slate.PubSub,
  live_view: [signing_salt: "dIk/3cfw"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :slate, Slate.Mailer,
  adapter: Bamboo.LocalAdapter,
  open_email_in_browser_url: "http://localhost:4000/sent_emails"

config :slate, Oban,
  repo: Slate.Repo,
  plugins: [Oban.Plugins.Pruner],
  queues: [default: 5]

import_config "#{Mix.env()}.exs"

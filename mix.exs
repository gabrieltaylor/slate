defmodule Slate.MixProject do
  use Mix.Project

  def project do
    [
      app: :slate,
      version: "0.2.1",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [
      mod: {Slate.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      # Phoenix
      {:phoenix, "~> 1.5.4"},
      {:phoenix_ecto, "~> 4.1"},
      {:phoenix_live_view, "~> 0.13.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.2"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},

      # Plugs
      {:plug_cowboy, "~> 2.0"},
      {:plug_heartbeat, "~> 1.0"},

      # Database
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.0.0"},

      # Auth
      {:phx_gen_auth, "~> 0.4.0", only: [:dev], runtime: false},
      {:bcrypt_elixir, "~> 2.0"},
      {:ueberauth, "~> 0.6"},
      {:ueberauth_google, "~> 0.8"},

      # Mailing
      {:bamboo, "~> 1.5"},

      # Background Work
      {:oban, "~> 2.1"},

      # Telemetry
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},

      # Testing
      {:floki, ">= 0.0.0", only: :test},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},

      # Linting
      {:credo, "~> 1.4", only: [:dev, :test], override: true},
      {:credo_envvar, "~> 0.1", only: [:dev, :test], runtime: false},
      {:credo_naming, "~> 0.4", only: [:dev, :test], runtime: false},

      # Test factories
      {:ex_machina, "~> 2.3", only: :test},
      {:faker, "~> 0.12", only: :test},

      # Test coverage
      {:excoveralls, "~> 0.11", only: :test},

      # Convenience
      {:shorter_maps, "~> 2.0"}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd npm install --prefix assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end

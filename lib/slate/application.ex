defmodule Slate.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Slate.Repo,
      SlateWeb.Telemetry,
      {Phoenix.PubSub, name: Slate.PubSub},
      SlateWeb.Endpoint,
      {Oban, oban_config()}
    ]

    opts = [strategy: :one_for_one, name: Slate.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    SlateWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do
    Application.get_env(:slate, Oban)

    # Prevent running queues or scheduling jobs from an iex console, i.e. when starting app with `iex -S mix`
    # if Code.ensure_loaded?(IEx) and IEx.started?() do
    #   opts
    #   |> Keyword.put(:crontab, false)
    #   |> Keyword.put(:queues, false)
    # else
    #   opts
    # end
  end
end

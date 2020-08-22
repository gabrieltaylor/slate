defmodule SlateWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :slate

  plug PlugHeartbeat, path: "/health", json: true

  # Optional BasicAuth configuration
  # https://devato.com/post/add-basic-auth-to-phoenix-with-environment-variables
  # if System.get_env("APP_DOMAIN") == "staging.myapp.com" do
  #   plug BasicAuth, Application.fetch_env!(:slate, BasicAuth)
  # end

  @session_options [
    store: :cookie,
    key: "_slate_key",
    signing_salt: "wLaB0TZB"
  ]

  socket "/socket", SlateWeb.UserSocket,
    websocket: true,
    longpoll: false

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :slate,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :slate
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug SlateWeb.Router
end

defmodule SlateWeb.Router do
  use SlateWeb, :router

  import SlateWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SlateWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SlateWeb do
    pipe_through :browser

    live "/", PageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", SlateWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: SlateWeb.Telemetry
    end
  end

  ## Authentication routes

  scope "/", SlateWeb.Users, as: :user do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", RegistrationController, :new
    post "/users/register", RegistrationController, :create
    get "/users/log_in", SessionController, :new
    post "/users/log_in", SessionController, :create
    get "/users/reset_password", ResetPasswordController, :new
    post "/users/reset_password", ResetPasswordController, :create
    get "/users/reset_password/:token", ResetPasswordController, :edit
    put "/users/reset_password/:token", ResetPasswordController, :update
  end

  scope "/", SlateWeb.Users, as: :user do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", SettingsController, :edit
    put "/users/settings/update_password", SettingsController, :update_password
    put "/users/settings/update_email", SettingsController, :update_email
    get "/users/settings/confirm_email/:token", SettingsController, :confirm_email
  end

  scope "/", SlateWeb.Users, as: :user do
    pipe_through [:browser]

    delete "/users/log_out", SessionController, :delete
    get "/users/confirm", ConfirmationController, :new
    post "/users/confirm", ConfirmationController, :create
    get "/users/confirm/:token", ConfirmationController, :confirm
  end

  # Bamboo local email
  if Mix.env() == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end
end

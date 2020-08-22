defmodule Slate.Repo do
  use Ecto.Repo,
    otp_app: :slate,
    adapter: Ecto.Adapters.Postgres
end

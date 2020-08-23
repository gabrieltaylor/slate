defmodule SlateWeb.PageController do
  use SlateWeb, :controller

  alias Slate.Accounts

  def home(conn, _params) do
    render(conn, "home.html")
  end
end

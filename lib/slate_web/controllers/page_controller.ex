defmodule SlateWeb.PageController do
  use SlateWeb, :controller

  def home(conn, _params) do
    render(conn, "home.html")
  end
end

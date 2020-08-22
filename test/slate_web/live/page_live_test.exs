defmodule SlateWeb.PageLiveTest do
  use SlateWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Slate"
    assert render(page_live) =~ "Slate"
  end
end

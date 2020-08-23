defmodule SlateWeb.PageLiveTest do
  use SlateWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/live-page")
    assert disconnected_html =~ "Home LiveView"
    assert render(page_live) =~ "Home LiveView"
  end
end

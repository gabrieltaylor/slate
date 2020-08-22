defmodule SlateWeb.HealthTest do
  use SlateWeb.ConnCase, async: true

  describe "GET /health" do
    test "returns ok", ~M{conn} do
      conn = get(conn, "/health")
      response = json_response(conn, 200)
      assert response == %{}
    end
  end
end

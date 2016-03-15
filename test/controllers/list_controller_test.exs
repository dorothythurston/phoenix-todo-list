defmodule PhoenixTodoList.ListControllerTest do
  use PhoenixTodoList.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "My Lists:"
  end
end

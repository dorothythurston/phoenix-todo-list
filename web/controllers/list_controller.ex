defmodule PhoenixTodoList.ListController do
  use PhoenixTodoList.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
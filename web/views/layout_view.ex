defmodule PhoenixTodoList.LayoutView do
  use PhoenixTodoList.Web, :view

  def current_user(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id do
      PhoenixTodoList.Repo.get!(PhoenixTodoList.User, user_id)
    end
  end
end

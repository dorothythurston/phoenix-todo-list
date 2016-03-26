defmodule PhoenixTodoList.ListController do
  use PhoenixTodoList.Web, :controller

  alias PhoenixTodoList.List

  def index(conn, _params) do
   conn
   |> assign(:lists, Repo.all(PhoenixTodoList.List))
   |> render("index.html")
  end

  def new(conn, _params) do
    changeset = List.changeset(%List{})
    render conn, :new, changeset: changeset
  end

  def create(conn, %{"list" => list_params}) do
    changeset = List.changeset(%List{}, list_params)

    case Repo.insert(changeset) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "Created list!")
        |> redirect(to: list_path(conn, :show, list))
      {:error, changset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    list = Repo.get!(List, id)
    render conn, :show, list: list
  end
end

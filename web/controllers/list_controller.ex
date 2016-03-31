defmodule PhoenixTodoList.ListController do
  use PhoenixTodoList.Web, :controller

  alias PhoenixTodoList.List
  alias PhoenixTodoList.Item

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
      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    list = Repo.get!(List, id) |> Repo.preload(:items)
    item_changeset = Item.changeset(%Item{})
    render conn, :show, list: list, item_changeset: item_changeset
  end

  def edit(conn, %{"id" => id}) do
    list = Repo.get!(List, id)
    changeset = List.changeset(list)
    render conn, :edit, changeset: changeset, list: list
  end

  def update(conn, %{"id" => id, "list" => list_params}) do
    list = Repo.get!(List, id)
    changeset = List.changeset(list, list_params)

    case Repo.update(changeset) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "Updated list!")
        |> redirect(to: list_path(conn, :show, list))
      {:error, changeset} ->
        render(conn, :edit, changeset: changeset, list: list)
    end
  end

  def delete(conn, %{"id" => id}) do
    list = Repo.get!(List, id)
    Repo.delete!(list)
    conn
    |> put_flash(:info, "List deleted successfully.")
    |> redirect(to: list_path(conn, :index))
  end
end

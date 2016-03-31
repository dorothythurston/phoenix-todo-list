defmodule PhoenixTodoList.ItemController do
  use PhoenixTodoList.Web, :controller

  alias PhoenixTodoList.Item

  def create(conn, %{"item" => item_params, "list_id" => list_id}) do
    item_params = Map.put(item_params, "list_id", list_id)
    changeset = Item.changeset(%Item{}, item_params)

    case Repo.insert(changeset) do
      {:ok, _list} ->
        conn
        |> put_flash(:info, "Created item!")
        |> redirect(to: list_path(conn, :show, list_id))
      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Repo.get!(Item, id)
    list_id = item.list_id
    Repo.delete(item)
    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: list_path(conn, :show, item.list_id))
  end
end

defmodule PhoenixTodoList.Factory do
  use ExMachina.Ecto, repo: PhoenixTodoList.Repo
  alias PhoenixTodoList.List
  alias PhoenixTodoList.Item

  def factory(:list) do
    %List{
      name: "List Name",
    }
  end

  def factory(:item) do
    %Item{
      name: "Item Name",
      content: "Some Content"
    }
  end
end

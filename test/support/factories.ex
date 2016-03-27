defmodule PhoenixTodoList.Factory do
  use ExMachina.Ecto, repo: PhoenixTodoList.Repo
  alias PhoenixTodoList.List

  def factory(:list) do
    %List{
      name: "List Name",
    }
  end
end

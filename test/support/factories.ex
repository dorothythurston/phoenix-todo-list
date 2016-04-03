defmodule PhoenixTodoList.Factory do
  use ExMachina.Ecto, repo: PhoenixTodoList.Repo
  alias PhoenixTodoList.List
  alias PhoenixTodoList.Item
  alias PhoenixTodoList.User

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

  def factory(:user) do
    %User{
      name: "Joe",
      email: sequence(:email, &"email-#{&1}@example.com"),
      password_digest: "password"
    }
  end
end

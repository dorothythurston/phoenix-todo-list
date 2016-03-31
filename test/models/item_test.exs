defmodule PhoenixTodoList.ItemTest do
  use PhoenixTodoList.ModelCase

  alias PhoenixTodoList.Item

  @valid_attrs %{content: "some content", name: "some content", list_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Item.changeset(%Item{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Item.changeset(%Item{}, @invalid_attrs)
    refute changeset.valid?
  end
end

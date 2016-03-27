defmodule AddListsTest do
  use PhoenixTodoList.FeatureCase

  test "user can add a list" do
    navigate_to("/")

    click_on "New List"

    fill_in("list[name]", "Awesome list")
    submit

    assert list_text =~ "Awesome list"
  end

  defp list_text do
    find_role("list")
    |> visible_text
  end
end

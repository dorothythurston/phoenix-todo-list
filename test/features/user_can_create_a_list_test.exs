defmodule AddListsTest do
  use PhoenixTodoList.FeatureCase

  test "user can add a list" do
    navigate_to("/")

    find_all_elements(:link_text, "New List")
    click {:link_text, "New List"}

    new_list_name = find_element(:id, "list-name")

    new_list_name
    |> find_within_element(:id, "list_name")
    |> fill_field("Awesome list")
    submit_element(new_list_name)

    assert visible_in_element?({:css, "h1"}, ~r/Awesome list/)
  end
end

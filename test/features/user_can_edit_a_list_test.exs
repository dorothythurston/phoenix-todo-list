defmodule EditListsTest do
  use PhoenixTodoList.FeatureCase
  import PhoenixTodoList.Factory

  test "user can edit a list" do
    list = create(:list)
    navigate_to("/lists/#{list.id}")
    assert visible_in_element?({:css, "h1"}, ~r/#{list.name}/)

    click {:link_text, "Edit List"}

    new_list_name = find_element(:id, "list-name")

    new_list_name
    |> find_within_element(:id, "list_name")
    |> fill_field("Awesome list")
    submit_element(new_list_name)

    assert visible_in_element?({:css, "h1"}, ~r/Awesome list/)
  end
end

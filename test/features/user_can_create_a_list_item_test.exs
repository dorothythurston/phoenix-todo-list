defmodule AddListItemsTest do
  use PhoenixTodoList.FeatureCase
  import PhoenixTodoList.Factory

  test "user can add a list item" do
    list = create(:list)
    navigate_to("/lists/#{list.id}")
    fill_in("item[name]", "Awesome name")
    fill_in("item[content]", "Awesome item")
    submit

    assert item_text =~ "Awesome name Awesome item"
  end
end

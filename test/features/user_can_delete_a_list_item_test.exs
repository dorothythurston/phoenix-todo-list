defmodule DeleteListItemsTest do
  use PhoenixTodoList.FeatureCase
  import PhoenixTodoList.Factory

  test "user can delete a list item" do
    list = create(:list)
    create(:item, list: list)
    navigate_to("/lists/#{list.id}")
    click_on "delete"

    assert visible_in_page?(~r/Item deleted successfully./)
  end
end

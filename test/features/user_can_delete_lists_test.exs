defmodule DeleteListsTest do
  use PhoenixTodoList.FeatureCase
  import PhoenixTodoList.Factory

  test "user can delete a list" do
    list = create(:list)
    navigate_to("/lists/#{list.id}")
    click_on "Delete List"
    assert visible_in_page?(~r/List deleted successfully./)
  end
end

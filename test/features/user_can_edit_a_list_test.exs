defmodule EditListsTest do
  use PhoenixTodoList.FeatureCase
  import PhoenixTodoList.Factory

  test "user can edit a list" do
    list = create(:list)
    navigate_to("/lists/#{list.id}")
    click_on "Edit List"
    fill_in("list[name]", "Awesome list")
    submit

    assert list_text =~ "Awesome list"
  end
end

defmodule DeleteSessionTest do
  use PhoenixTodoList.FeatureCase
  import PhoenixTodoList.Factory

  test "user can sign out" do
    user = create(:user)
    navigate_to "/", as: user
    click_on "Sign Out"
    assert visible_page_text  =~ "You have been logged out"
  end
end

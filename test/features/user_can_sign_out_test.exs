defmodule DeleteSessionTest do
  use PhoenixTodoList.FeatureCase
  import PhoenixTodoList.Factory

  test "user can sign out" do
     user = create(:user)
     navigate_to("/sign_in")
     fill_in("user[email]", user.email)
     fill_in("user[password]", user.password_digest)
     submit

    click_on "Sign Out"
    assert visible_page_text  =~ "You have been logged out"
  end
end

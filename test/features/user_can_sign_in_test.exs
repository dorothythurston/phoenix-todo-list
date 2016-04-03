defmodule NewSessionTest do
  use PhoenixTodoList.FeatureCase
  import PhoenixTodoList.Factory

  test "user signs in" do
    user = create(:user)
    navigate_to("/sign_in")
    fill_in("user[email]", user.email)
    fill_in("user[password]", user.password_digest)
    submit

    assert visible_page_text  =~ "Welcome!"
  end

  test "user signs in with bad password" do
    user = create(:user)
    navigate_to("/sign_in")
    fill_in("user[email]", user.email)
    fill_in("user[password]", "bad passord")
    submit

    assert visible_page_text  =~ "Username or password are incorrect."
  end

  test "user signs in with non existing user" do
    navigate_to("/sign_in")
    fill_in("user[email]", "i@dontexist.com")
    fill_in("user[password]", "bad passord")
    submit

    assert visible_page_text  =~ "Could not find a user with that username."
  end
end

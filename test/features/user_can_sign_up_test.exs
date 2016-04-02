defmodule AddUsersTest do
  use PhoenixTodoList.FeatureCase

  test "user sign up" do
    navigate_to("/sign_up")

    fill_in("user[name]", "Awesome list")
    fill_in("user[email]", "email@email.com")
    fill_in("user[password]", "password")
    fill_in("user[password_confirmation]", "password")
    submit

    assert visible_page_text  =~ "Successfully signed up!"
  end
end

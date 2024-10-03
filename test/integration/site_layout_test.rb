require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", '#', text: "Log in"
    
    # Checking the registration page
    get signup_path
    # Correct the title to the current one
    assert_select "title", "Sign up | Ruby on Rails Tutorial Sample App"
  end
end

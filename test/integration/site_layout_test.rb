require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", '#', text: "Log in"
    
    # Проверка страницы регистрации
    get signup_path
    # Исправляем заголовок на актуальный
    assert_select "title", "Sign up | Ruby on Rails Tutorial Sample App"
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "password should include at least one letter and one digit" do
    @user.password = @user.password_confirmation = "password"  
    assert_not @user.valid?
    
    @user.password = @user.password_confirmation = "12345678"  
    assert_not @user.valid?
    
    @user.password = @user.password_confirmation = "password123"
    assert @user.valid?
  end
end
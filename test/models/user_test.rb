require 'test_helper'
require "minitest/reporters"
Minitest::Reporters.use!

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "User", last_name: "name", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  
  test "name should be present (nil)" do
    @user.last_name = @user.last_name = " "
    assert_not @user.valid?
  end

  test "name should be present (nonblank)" do
    @user.last_name = @user.last_name = nil
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
 
end

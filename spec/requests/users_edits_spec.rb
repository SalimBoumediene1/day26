require 'test_helper'
require "minitest/reporters"
Minitest::Reporters.use!

class UsersEditTest < ActionDispatch::IntegrationTest

  test "unsuccessful edit" do
    get edit_user_path(users(:michael))
  end
end
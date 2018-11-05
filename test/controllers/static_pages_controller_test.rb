require 'test_helper'
require "minitest/reporters"
Minitest::Reporters.use!

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should access only members" do
   get club_path
  end

end

require 'test_helper'
require "minitest/reporters"
Minitest::Reporters.use!

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", login_path
    if session[:user_id]
        assert_select "a[href=?]", logout_path
        assert_select "a[href=?]", club_path
    end
  end

  test "login links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", login_path
    if session[:user_id]
        assert_select "a[href=?]", logout_path
        assert_select "a[href=?]", club_path
    end
  end

  test "navbar should have the good links" do
    get root_path
    assert_select "nav"
    assert_select "nav ul" do
      assert_select "li"do
        assert_select "a[href=?]", login_path
        assert_select "a[href=?]", root_path
        if session[:user_id]
          assert_select "a[href=?]", logout_path
          assert_select "a[href=?]", club_path
        end
      end
    end
  end
end

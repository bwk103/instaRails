require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "root should be home" do
    get root_path
    assert_select'h1', text: 'Welcome to instaRails'
    assert_select 'p', text: 'Sign up to start sharing your photos!'
    assert_select 'a[href=?]', login_path, count: 1
    assert_select 'a[href=?]', signup_path, count: 2
    assert_select 'title', text: 'Home | instaRails'
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", text: 'About | instaRails'
  end

end

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "root should be home" do
    get root_path
    assert_select 'h1', text: 'This is the home page'
    assert_select'p', text: 'Welcome to instaRails!'
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

end

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
  end

  test 'home page layout' do
    get root_path
    assert_select 'a', text:'instaRails', count: 1
    assert_select 'a[href=?]', posts_path, count: 1
    assert_select 'a[href=?]', signup_path, count: 2
    assert_select 'a[href=?]', login_path, count: 1
    assert_select 'h1', text: 'Welcome to instaRails'
    assert_select 'p', text: 'Sign up to start sharing your photos!'
    assert_select 'a', text: 'Sign Up'
    log_in_as(@user)
    get root_path
    assert_select 'a[href=?]', posts_path, count: 1
    assert_select 'a[href=?]', signup_path, count: 1
    assert_select 'a[href=?]', login_path, count: 1
    assert_select 'a[href=?]', new_post_path, count: 1
  end
end

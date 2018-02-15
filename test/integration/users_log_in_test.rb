require 'test_helper'

class UsersLogInTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
  end

  test 'valid login' do
    get login_path
    assert_not is_logged_in?
    assert_select 'a[href=?]', signup_path
    assert_select 'a[href=?]', login_path
    assert_select 'a', text: 'Sign Out', count: 0
    post login_path, params: {session: { username: @user.username,
                                         password: 'password'}}
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_select 'a[href=?]', signup_path, count: 0
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a', text: 'Sign Out', count: 1
    assert_template 'users/show'
  end

  test 'invalid login' do
    get login_path
    assert_not is_logged_in?
    assert_select 'a[href=?]', signup_path
    assert_select 'a[href=?]', login_path
    assert_select 'a', text: 'Sign Out', count: 0
    post login_path, params: {session: { username: @user.username,
                                         password: 'not-password'}}
    assert_not is_logged_in?
    assert_select 'a[href=?]', signup_path
    assert_select 'a[href=?]', login_path
    assert_select 'a', text: 'Sign Out', count: 0
    assert_template 'sessions/new'
  end
end

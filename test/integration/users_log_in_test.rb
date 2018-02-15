require 'test_helper'

class UsersLogInTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create!(name: 'Jamie', username: 'jamie314',
                         email: 'jamie@test.com',
                         password: 'password',
                         password_confirmation: 'password')
  end

  test 'valid login' do
    get login_path
    assert_not is_logged_in?
    post login_path, params: {session: { username: 'jamie314',
                                         password: 'password'}}
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
  end

  test 'invalid login' do
    get login_path
    assert_not is_logged_in?
    post login_path, params: {session: { username: 'bobby',
                                         password: 'testing'}}
    assert_not is_logged_in?
    assert_template 'sessions/new'
  end
end

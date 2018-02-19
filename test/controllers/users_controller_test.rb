require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create!(name: 'Bob', username: 'bobby', email: 'bob@test.com',
                 password: 'password', password_confirmation: 'password')
    @user2 = users(:james)
  end

  test 'invalid login' do
    get login_path
    post login_path, params: {session: { username: 'Andy', password: 'boo'}}
    assert_template 'sessions/new'
    assert_not flash.empty?
  end

  test 'valid login' do
    get login_path
    post login_path, params: {session: { username: 'bobby',
                                         password: 'password'}}
    assert_redirected_to user_path(@user)
  end

  test 'redirected from edit if user not logged in' do
    get edit_user_path(@user.id)
    assert_redirected_to login_url
  end

  test 'redirected from edit if user is not correct user' do
    log_in_as(@user)
    get edit_user_path(@user2.id)
    assert_redirected_to root_url
  end

  test 'user can access edit page if logged in as correct user' do
    log_in_as(@user)
    get edit_user_path(@user.id)
    assert_template 'users/edit'
  end

  test 'invalid edits are redirected to edit page' do
    log_in_as(@user)
    get edit_user_path(@user.id)
    patch user_path, params: {user: { name: '', username: '',
                                           email: '', password: '',
                                           password_confirmation: ''}}
    assert_template 'users/edit'
  end

  test 'valid edits are redirected to profile page' do
    log_in_as(@user)
    get edit_user_path(@user.id)
    patch user_path, params: {user: { name: 'Bob Smith',
                                      username: @user.username,
                                      email: @user.email,
                                      password: @user.password,
                            password_confirmation: @user.password_confirmation
                            }}
    assert_redirected_to @user
  end
end

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create!(name: 'Bob', username: 'bobby', email: 'bob@test.com',
                 password: 'password', password_confirmation: 'password')
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
end

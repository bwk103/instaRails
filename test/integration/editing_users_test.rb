require 'test_helper'

class EditingUsersTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
    @user2 = users(:mike)
  end

  test 'invalid editing' do
    get edit_user_path(@user.id)
    assert_redirected_to login_url
    log_in_as(@user)
    get edit_user_path(@user2.id)
    assert_redirected_to root_url
    get edit_user_path(@user.id)
    assert_template 'users/edit'
    patch user_path, params: {user: { name: '',
                                      username: @user.username,
                                      email: @user.email,
                                      profile: @user.profile,
                                      password: 'password',
                                      password_confirmation: 'password'}}
    assert_template 'users/edit'
  end

  test 'valid editing' do
    log_in_as(@user)
    get edit_user_path(@user.id)
    patch user_path, params: {user: { name: 'James Smith',
                                      username: @user.username,
                                      profile: @user.profile,
                                      password: 'password',
                                      password_confirmation: 'password'}}
    assert_redirected_to @user
    assert @user.name = 'James Smith'
  end
end

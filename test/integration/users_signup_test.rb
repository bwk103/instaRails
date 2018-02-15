require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test 'valid signup' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: { name: 'Bruce',
                                        username: 'Bingo',
                                        email: 'bruce@test.com',
                                        password: 'password',
                                        password_confirmation: 'password'

                                       }}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end

  test 'invalid signup' do
    get signup_path
    assert_no_difference 'User.count', 1 do
      post users_path, params: {user: { name: '',
                                        username: 'Jimbo',
                                        email: 'james@test.com',
                                        password: 'password',
                                        password_confirmation: 'password'

        }}
    end
    assert_template 'users/new'
    assert_select 'div.alert-danger'
  end
end

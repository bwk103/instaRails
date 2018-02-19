require 'test_helper'

class DeletingUsersTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
    @user2 = users(:mike)
  end

  test 'invalid delete requests' do
    log_in_as(@user)
    assert_no_difference 'User.count' do
      delete user_path(@user2)
    end
  end

  test 'valid delete request' do
    log_in_as(@user)
    assert_difference 'User.count', -1 do
      delete user_path(@user)
    end
  end
end

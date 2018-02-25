require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
    @user2 = users(:mike)
  end

  test 'create should redirect if not logged in' do
    post relationships_path, params: {relationship: { follower_id: @user.id,
                                                      followed_id: @user2.id
                                      }}
    assert_redirected_to login_url
  end

  test 'follow user' do
    log_in_as(@user)
    assert_difference 'Relationship.count', 1 do
      post relationships_path, params: { relationship: { follower_id: @user.id,
                                                        followed_id: @user2.id}}
    end
  end

  test 'destroy should redirect if not logged in' do
    assert_no_difference 'Relationship.count' do
      post relationships_path, params: { relationship: { follower_id: @user.id,
                                                    followed_id: @user2.id}}
    end
    assert_redirected_to login_url
  end
end

require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:james)
    @user2 = users(:mike)
    @relationship = relationships(:first)
  end

  test "create should redirect if not logged in" do
    post relationships_path, params: { follower_id: @user.id,
                                       followed_id: @user2.id }
    assert_redirected_to login_url
  end

  test "follow user" do
    log_in_as(@user)
    assert_difference "Relationship.count", 1 do
      post relationships_path, params: { follower_id: @user.id,
                                         followed_id: @user2.id }
    end
  end

  test "destroy should redirect if not logged in" do
    assert_no_difference "Relationship.count" do
      delete relationship_path(@relationship)
    end
    assert_redirected_to login_url
  end

  test "unfollow user" do
    log_in_as(@user)
    assert_difference "Relationship.count", -1 do
      delete relationship_path(@relationship)
    end
  end

  test "can follow user using AJAX" do
    log_in_as(@user)
    assert_difference "Relationship.count", 1 do
      post relationships_path, params: { follower_id: @user.id,
                                         followed_id: @user2.id }
    end
  end

  test "can unfollow using AJAX" do
    log_in_as(@user)
    assert_difference "Relationship.count", -1 do
      delete relationship_path(@relationship), xhr: true
    end
  end
end

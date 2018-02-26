require "test_helper"

class ViewingPostsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:james)
  end

  test "users can see individual posts and details" do
    log_in_as(@user)
    get posts_path
    assert_match @user.username, response.body
  end
end

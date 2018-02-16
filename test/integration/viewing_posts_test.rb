require 'test_helper'

class ViewingPostsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
  end

  test 'users can see individual posts and details' do
    get posts_path
    assert_match @user.name, response.body
  end
end

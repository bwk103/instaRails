require 'test_helper'

class DeletePostsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
    @user2 = users(:mike)
    @post = posts(:first)
  end

  test 'invalid post deletion request' do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to login_url
    log_in_as(@user2)
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to root_url
  end

  test 'valid post deletion request' do
    log_in_as(@user)
    assert_difference 'Post.count', -1 do
      delete post_path(@post)
    end
  end

end

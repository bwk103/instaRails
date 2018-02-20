require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
    @post = posts(:first)
  end

  test "should redirect create if not logged in" do
    get comments_create_url
    assert_redirected_to login_url
  end

  test "invalid comment should be redirected to posts" do
    log_in_as(@user)
    post comments_path, params: { comment: { content: 'This is a comment',
                                             user_id: @user.id,
                                             post_id: ''
                                           }
    }
    assert_redirected_to posts_path
    message = 'There was a problem submitting your comment'
    assert_not flash.empty?
  end

  test 'valid comments are redirected to posts' do
    log_in_as(@user)
    post comments_path, params: { comment: { content: 'This is a comment',
                                             user_id: @user.id,
                                             post_id: @post.id
                                           }
    }
    assert_redirected_to posts_path
  end

end

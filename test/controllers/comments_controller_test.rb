require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
    @user2 = users(:mike)
    @post = posts(:first)
    @comment = comments(:one)
  end

  test "should redirect create if not logged in" do
    get comments_create_url
    assert_redirected_to login_url
  end

  test "invalid comment should be redirected to posts" do
    log_in_as(@user)
    post comments_path, params: { comment: { content: '',
                                             user_id: @user.id,
                                             post_id: @post.id
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

  test 'delete requests redirected if not logged in' do
    delete comment_path(@comment)
    assert_redirected_to login_url
  end

  test 'delete requests redirected if not correct user' do
    log_in_as(@user2)
    delete comment_path(@comment)
    assert_redirected_to posts_path
  end

  test 'valid delete requests remove comment' do
    log_in_as(@user)
    assert_difference 'Comment.count', -1 do
      delete comment_path(@comment)
    end
  end
end

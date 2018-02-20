require 'test_helper'

class AddingAndDeletingCommentsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
    @user2 = users(:mike)
    @comment = comments(:one)
    @post = posts(:first)
  end

  test 'posting invalid comment' do
    assert_no_difference 'Comment.count' do
      post comments_path, params: {comment: { content: 'A test!',
                                            user_id: @user_id,
                                            post_id: @post_id
                                            }}
    end
    assert_redirected_to login_url
    log_in_as(@user)
    assert_no_difference 'Comment.count' do
      post comments_path, params: {comment: { content: '',
                                          user_id: @user_id,
                                          post_id: @post_id
                                          }}
      end
    assert_redirected_to posts_path
    follow_redirect!
    message = 'There was a problem submitting your comment'
    assert_select 'div.alert-danger', text: message
  end

  test 'posting valid comment' do
    log_in_as(@user)
    assert_difference 'Comment.count', 1 do
      post comments_path, params: { comment: { content: 'This is a comment',
                                               user_id: @user.id,
                                               post_id: @post.id
                                             }
      }
    end
    assert_redirected_to posts_path
    follow_redirect!
    assert_match 'This is a comment', response.body
  end

  test 'invalid deletion requests' do
    assert_no_difference 'Comment.count' do
      delete comment_path(@comment)
    end
    log_in_as(@user2)
    assert_no_difference 'Comment.count' do
      delete comment_path(@comment)
    end
    follow_redirect!
    assert_match @comment.content, response.body
  end

  test 'valid deletion request' do
    log_in_as(@user)
    assert_difference 'Comment.count', -1 do
      delete comment_path(@comment)
    end
    follow_redirect!
    assert_no_match @comment.content, response.body
  end
end

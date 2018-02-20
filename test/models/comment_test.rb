require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = users(:james)
    @comment = Comment.new(content: 'This is a test comment', user_id: @user.id)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test 'content is required' do
    @comment.content = ''
    assert_not @comment.valid?
  end

  test 'content cannot be longer than 300 characters' do
    @comment.content = 'a' * 301
    assert_not @comment.valid?
  end

  test 'content must have a user_id' do
    @comment.user_id = nil
    assert_not @comment.valid?
  end
end

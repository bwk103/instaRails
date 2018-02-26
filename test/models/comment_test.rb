require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:james)
    @post = posts(:first)
    @comment = Comment.new(content: "This is a test comment", user_id: @user.id,
                           post_id: @post.id)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "content is required" do
    @comment.content = ""
    assert_not @comment.valid?
  end

  test "content cannot be longer than 300 characters" do
    @comment.content = "a" * 301
    assert_not @comment.valid?
  end

  test "comment must belong to a user" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "comment must belong to a post" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end
end

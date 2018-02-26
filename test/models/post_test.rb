require "test_helper"

class PostTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess

  def setup
    @user = users(:james)
    picture = fixture_file_upload("/test-cat.jpg", "img/jpg")
    @comment = Comment.new(content: "This is a comment")
    @post = Post.new(caption: "This is a test", user_id: @user.id,
                     picture: picture)
  end

  test "captions should be no longer than 2,200 characters" do
    assert_no_difference "Post.count" do
      @post.caption = "a" * 2201
      @post.save
    end
  end

  test "posts require a picture to be valid" do
    assert_no_difference "Post.count" do
      @post.picture = ""
      @post.save
    end
  end

  test "valid post" do
    assert_difference "Post.count", 1 do
      @post.save
    end
  end

  test "returns most recent post first" do
    assert_equal posts(:most_recent), Post.first
  end

  test "posts can have a location" do
    @post.location = "Test Location"
    assert @post.valid?
  end

  test "posts may not have a location" do
    @post.location = nil
    assert @post.valid?
  end

  test "locations have character limits of 100" do
    @post.location = "@" * 101
    assert_not @post.valid?
  end
end

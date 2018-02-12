require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test 'valid post' do
    assert_difference 'Post.count', 1 do
      @post = Post.new
      @post.caption = 'This is a test post'
      @post.save
    end
  end

  test 'captions should be no longer than 2,200 characters' do
    assert_no_difference 'Post.count' do
      @post = Post.new
      @post.caption = 'a' * 2201
      @post.save
    end
  end
end

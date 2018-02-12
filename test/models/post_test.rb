require 'test_helper'

class PostTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess

  test 'captions should be no longer than 2,200 characters' do
    assert_no_difference 'Post.count' do
      @post = Post.new
      @post.caption = 'a' * 2201
      @post.save
    end
  end

  test 'posts require a picture to be valid' do
    assert_no_difference 'Post.count' do
      @post = Post.new
      @post.caption = 'This is a test'
      @post.save
    end
  end

  test 'valid post' do
    picture = fixture_file_upload('/test-cat.jpg', 'img/jpg')
    assert_difference 'Post.count', 1 do
      @post = Post.new
      @post.picture = picture
      @post.caption = 'This is a test post'
      @post.save
    end
  end
end

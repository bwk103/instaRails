require 'test_helper'

class PostSubmissionTest < ActionDispatch::IntegrationTest

  test 'submitting invalid posts' do
    get posts_path
    assert_no_difference 'Post.count', 1 do
      post posts_path, params: { post: { content: 'This is a cat',
                                         picture: 'blank'
                                        }}
    end
    assert_redirected_to root_url
  end

  test 'submitting valid posts' do
    get posts_path
    picture = fixture_file_upload('/test-cat.jpg', 'img/jpg')
    assert_difference 'Post.count', 1 do

      post posts_path, params: { post: { content: 'This is a cat',
                                       picture: picture
                                       }}
    end
    assert_redirected_to posts_path
  end

end

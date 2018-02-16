require 'test_helper'

class PostSubmissionTest < ActionDispatch::IntegrationTest
  include ActionView::Helpers::TextHelper


  def setup
    @user = users(:james)
    @picture = fixture_file_upload('/test-cat.jpg', 'img/jpg')
    log_in_as(@user)
  end

  test 'submitting invalid posts' do
    assert is_logged_in?
    get new_post_path
    assert_no_difference 'Post.count', 1 do
      post posts_path, params: { post: { caption: 'This is a cat',
                                         picture: ''
                                        }}
    end
    assert_template 'posts/new'
  end

  test 'submitting valid posts' do
    get new_post_path
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { caption: 'This is a cat',
                                       picture: @picture
                                       }}
    end
    assert_redirected_to posts_path
  end

  # test 'submitting via AJAX' do
  #   get new_post_path
  #   assert_difference '@user.posts.count', 1 do
  #     post posts_path, xhr:true, params: { post: { caption: 'This is a cat',
  #                                        picture: @picture
  #                                        }}
  #   end
  # end

end

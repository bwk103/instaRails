require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
  end

  test 'users cannot access new post page unless logged in' do
    get new_post_path
    assert_redirected_to login_url
  end

  test 'logged in users can access new post page' do
    log_in_as(@user)
    get new_post_path
    assert_template 'posts/new'
  end

end

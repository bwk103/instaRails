require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
    @user2 = users(:mike)
    @post = posts(:first)
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

  test 'delete redirects if not logged in' do
    delete post_path(@post.id)
    assert_redirected_to login_url
  end

  test 'delete redirects if not correct user' do
    log_in_as(@user2)
    delete post_path(@post)
    assert_redirected_to root_url
  end

  test 'after post deletion user redirected to posts' do
    log_in_as(@user)
    delete post_path(@post)
    assert_redirected_to posts_url
  end

end

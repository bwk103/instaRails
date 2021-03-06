require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:james)
    @user2 = users(:mike)
  end

  test "home page layout" do
    get root_path
    assert_select "a", text: "instaRails", count: 1
    assert_select "a[href=?]", posts_path, count: 1
    assert_select "a[href=?]", signup_path, count: 2
    assert_select "a[href=?]", login_path, count: 2
    assert_select "h1", text: "instaRails"
    assert_select "h4", text: "share your joy"
    assert_select "a", text: "Sign Up"
    assert_select "a", text: "Log In"
    log_in_as(@user)
    get root_path
    assert_select "a[href=?]", posts_path, count: 1
    assert_select "a[href=?]", signup_path, count: 1
    assert_select "a[href=?]", login_path, count: 2
    assert_select "a[href=?]", new_post_path, count: 1
  end

  test "user profile layout" do
    log_in_as(@user)
    get user_path(@user)
    assert_template "users/show"
    assert_select "img", src: @user.profile
    assert_match @user.username, response.body
    assert_match @user.posts.count.to_s, response.body
    assert_match @user.name, response.body
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a", text: "Delete Account"
    get user_path(@user2)
    assert_select "a[href=?]", edit_user_path(@user2), count: 0
    assert_select "a", text: "Delete Account", count: 0
  end

  test "user directory layout" do
    log_in_as(@user)
    get user_path(@user)
    assert_template "users/show"
    get users_path
    assert_template "users/index"
    assert_match @user2.username, response.body
    assert_no_match @user.username, response.body
  end
end

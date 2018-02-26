require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess

  def setup
    @user = User.new(name: 'Bob Smith', username: 'bobby',
                     email: 'bob@test.com', password: 'testing',
                     password_confirmation: 'testing')
  end

  test 'name, username and email are required' do
    @user.name = ''
    assert_not @user.valid?
    @user.name = 'Bob'
    assert @user.valid?
    @user.username = ''
    assert_not @user.valid?
    @user.username = 'bobby'
    assert @user.valid?
    @user.email = ''
    assert_not @user.valid?
    @user.email = 'bob@test.com'
    assert @user.valid?
  end

  test 'email requires necessary format' do
    @user.email = 'not_an_email'
    assert_not @user.valid?
    @user.email = 'bob@test.com'
    assert @user.valid?
  end

  test 'email is unique' do
    @user.save
    @user2 = User.new(name: 'Bill', email: 'bob@test.com', password: 'testing',
                    password_confirmation: 'testing')
    assert_no_difference 'User.count' do
      @user2.save
    end
  end

  test 'password is required' do
    @user.password = ''
    @user.password_confirmation = ''
    assert_not @user.valid?
  end

  test 'password cannot be blank' do
    @user.password = @user.password_confirmation = ' ' * 5
    assert_not @user.valid?
  end

  test 'password should have a minimum length of 5' do
    @user.password = @user.password_confirmation = 'test'
    assert_not @user.valid?
  end

  test 'users can save profile image' do
    profile = fixture_file_upload('/43.jpg', 'img/jpg')
    @user.profile = profile
    @user.save
    assert_not User.last.profile.nil?
  end

  test 'users can have a bio' do
    bio_text = 'This is just an example bio.'
    @user.bio = bio_text
    assert @user.valid?
  end

  test 'bio is limited to 150 characters' do
    @user.bio = 'a' * 151
    assert_not @user.valid?
  end

  test 'users can select not to have a bio' do
    @user.bio = nil
    assert @user.valid?
  end

  test 'should follow and unfollow users' do
    james = users(:james)
    mike = users(:mike)
    assert_not james.following?(mike)
    james.follow(mike)
    assert james.following?(mike)
    assert mike.followers.include?(james)
    james.unfollow(mike)
    assert_not james.following?(mike)
  end

  test 'feed should contain the correct posts' do
    james = users(:james)
    mike = users(:mike)
    mia = users(:mia)
    mia.posts.each do |post_following|
      assert james.feed.include?(post_following)
    end
    james.posts.each do |own_post|
      assert james.feed.include?(own_post)
    end
    mike.posts.each do |not_following_post|
      assert_not james.feed.include?(not_following_post)
    end
  end
end

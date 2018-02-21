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
end

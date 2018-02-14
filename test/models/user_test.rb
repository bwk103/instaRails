require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'Bob', email: 'bob@test.com', password: 'testing',
                  password_confirmation: 'testing')
  end

  test 'name and email are required' do
    @user.name = ''
    assert_not @user.valid?
    @user.name = 'Bob'
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
end

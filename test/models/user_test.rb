require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'name is unique' do
    User.create!(name: 'Bob', email: 'bob@test.com')
    @user = User.new
    @user.name = 'Bob'
    @user.email = 'bob@test.com'
    assert_no_difference 'User.count' do
      @user.save
    end
    assert_not @user.errors.empty?
  end

  test 'name and email are required' do
    @user = User.new
    assert_not @user.valid?
    @user.name = 'Bob'
    assert_not @user.valid?
    @user.email = 'bob@test.com'
    assert @user.valid?
  end

  test 'email requires necessary format' do
    @user = User.new
    @user.name = 'Bob'
    @user.email = 'not_an_email'
    assert_not @user.valid?
    @user.email = 'bob@test.com'
    assert @user.valid?
  end

  test 'email is unique' do
    User.create!(name: 'Bob', email: 'bob@test.com')
    @user = User.new
    @user.name = 'Bill'
    @user.email = 'bob@test.com'
    assert_no_difference 'User.count' do
      @user.save
    end
    assert_not @user.errors.empty?
  end

end

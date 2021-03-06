require 'coveralls'
Coveralls.wear!('rails')
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter "/bin/"
end
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/reporters"

Minitest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all

  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  def log_in_as(user, password: "password")
    post login_path, params: { session: { username: user.username,
                                          password: password } }
  end
end

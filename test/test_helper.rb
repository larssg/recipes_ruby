ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class Test::Unit::TestCase
  def sign_in_as(user = nil)
    unless user
      user = Factory(:user)
      user.confirm_email!
    end
    @request.session[:user_id] = user.id
    return user
  end
end

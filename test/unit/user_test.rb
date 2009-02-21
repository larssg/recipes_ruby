require 'test_helper'

class UserTest < Test::Unit::TestCase
  #   include Clearance::Test::Unit::UserTest

  should_have_many :recipes
end

require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  should_validate_presence_of :name
end

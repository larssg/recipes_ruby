require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  should_belong_to :user
  
  should_validate_presence_of :user_id
  should_validate_presence_of :name
  should_not_allow_mass_assignment_of :user_id

  should_have_many :recipe_ingredients
end

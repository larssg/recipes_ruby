require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase
  should_validate_presence_of :recipe_id
  should_validate_presence_of :ingredient_id

  should_belong_to :recipe
  should_belong_to :ingredient
  
  should "have a working factory" do
    recipe_ingredient = Factory(:recipe_ingredient)
    assert recipe_ingredient.valid?
  end
  
  should "create ingredient from ingredient_name" do
    recipe_ingredient = Factory.build(:recipe_ingredient)
    recipe_ingredient.ingredient_name = 'Garlic'
    recipe_ingredient.save

    recipe_ingredient.reload
    assert_equal 'Garlic', recipe_ingredient.ingredient.name
  end

  should "not create a new ingredient if it already exists" do
    ingredient = Factory(:ingredient, :name => 'Potato')
    recipe_ingredient = Factory.build(:recipe_ingredient)
    recipe_ingredient.ingredient_name = 'Potato'
    recipe_ingredient.save

    recipe_ingredient.reload
    assert_equal ingredient.id, recipe_ingredient.ingredient_id
  end
end

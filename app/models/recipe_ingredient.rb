class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  
  validates_presence_of :recipe_id
  validates_presence_of :ingredient_id

  attr_accessor :ingredient_name

  before_save :set_ingredient

  protected
  def set_ingredient
    return unless ingredient_needs_update?
    self.ingredient = Ingredient.find_or_create_by_name(self.ingredient_name)
  end

  def ingredient_needs_update?
    self.ingredient.andand.name != self.ingredient_name
  end
end

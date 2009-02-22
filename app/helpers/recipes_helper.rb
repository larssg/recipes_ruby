module RecipesHelper
  def setup_recipe(recipe)
    returning(recipe) do |r|
      r.recipe_ingredients.build
    end
  end
end

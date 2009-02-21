Factory.define :recipe_ingredient do |recipe_ingredient|
  recipe_ingredient.association :recipe
  recipe_ingredient.association :ingredient
end

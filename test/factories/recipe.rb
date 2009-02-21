Factory.sequence :recipe_name do |n|
  "Recipe #{n}"
end

Factory.define :recipe do |recipe|
  recipe.association :user
  recipe.name { Factory.next :recipe_name }
  recipe.portions 4
  recipe.instructions 'Instructions'
end

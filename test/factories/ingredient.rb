Factory.sequence :ingredient_name do |n|
  "Ingredient #{n}"
end

Factory.define :ingredient do |ingredient|
  ingredient.name { Factory.next :ingredient_name }
end

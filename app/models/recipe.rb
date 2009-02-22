class Recipe < ActiveRecord::Base
  belongs_to :user

  has_many :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true

  validates_presence_of :user_id
  validates_presence_of :name

  attr_accessible :name, :portions, :instructions, :recipe_ingredients_attributes
end

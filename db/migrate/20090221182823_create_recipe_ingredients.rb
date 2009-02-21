class CreateRecipeIngredients < ActiveRecord::Migration
  def self.up
    create_table :recipe_ingredients do |t|
      t.references :recipe
      t.references :ingredient
      t.float :amount
      t.string :unit
      t.string :extra
      t.timestamps
    end
  end

  def self.down
    drop_table :recipe_ingredients
  end
end

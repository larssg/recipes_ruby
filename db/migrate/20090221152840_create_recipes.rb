class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.references :user
      t.string :name
      t.integer :portions
      t.text :instructions
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end

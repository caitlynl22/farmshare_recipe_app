class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredient_list
      t.text :instructions

      t.timestamps null: false
    end
  end
end
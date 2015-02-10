class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.belongs_to :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :recipes
  end
end

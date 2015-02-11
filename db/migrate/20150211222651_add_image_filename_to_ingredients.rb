class AddImageFilenameToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :image_filename, :string
  end
end

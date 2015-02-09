class Recipe < ActiveRecord::Base
  validates :title, :ingredient_list, :instructions, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end

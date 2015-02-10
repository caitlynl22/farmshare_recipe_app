require 'rails_helper'

RSpec.describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      expect(Comment.create()).to be_a Comment
    end

    it 'creates a relationship with recipes' do
    ingredient = Ingredient.create!(name: 'Carrots')
    recipe = ingredient.recipes.create!(title: 'Garden Fries', ingredient_list: "1 lb of root veggies, 1 tbsp olive oil, 1/8 tsp ground red pepper, 1/8 tsp garlic powder, 1/2 tsp Worcestershire sauce", instructions: "Preheat oven to 450. In a large bowl combine the sliced vegetables, olive oil, red pepper, garlic powder and Worcestershire and toss to coat well. Lay the vegetables out on a baking sheet in a single layer. Bake for 30 minutes, turning once. Serve the fries hot with your favorite sauce or ketchup!")
    comment = Comment.create!(name: 'John', body: 'Awesome recipe!')

    recipe.comments << comment

    expect(recipe.comments).to eq([comment])
    end
  end
end

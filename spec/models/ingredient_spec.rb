require 'rails_helper'

RSpec.describe Ingredient do
  describe '.create' do
    it 'creates a new ingredient' do
      expect(Ingredient.create()).to be_a Ingredient
    end

    it 'is invalid without a name' do
      expect(Ingredient.create(name: '')).not_to be_valid
    end
  end

  describe 'RecipeIngredient' do
    it 'creates a relationship with Recipe' do
    ingredient = Ingredient.create!(name: 'Carrots')
    recipe = Recipe.create!(title: 'Garden Fries', ingredient_list: "1 lb of root veggies, 1 tbsp olive oil, 1/8 tsp ground red pepper, 1/8 tsp garlic powder, 1/2 tsp Worcestershire sauce", instructions: "Preheat oven to 450. In a large bowl combine the sliced vegetables, olive oil, red pepper, garlic powder and Worcestershire and toss to coat well. Lay the vegetables out on a baking sheet in a single layer. Bake for 30 minutes, turning once. Serve the fries hot with your favorite sauce or ketchup!")

    ingredient.recipes << recipe

    expect(RecipeIngredient.first.ingredient).to eq(ingredient)
    expect(RecipeIngredient.first.recipe).to eq(recipe)
    end

    it "has recipes" do
    ingredient = Ingredient.create!(name: 'Carrots')
    recipe = Recipe.create!(title: 'Garden Fries', ingredient_list: "1 lb of root veggies, 1 tbsp olive oil, 1/8 tsp ground red pepper, 1/8 tsp garlic powder, 1/2 tsp Worcestershire sauce", instructions: "Preheat oven to 450. In a large bowl combine the sliced vegetables, olive oil, red pepper, garlic powder and Worcestershire and toss to coat well. Lay the vegetables out on a baking sheet in a single layer. Bake for 30 minutes, turning once. Serve the fries hot with your favorite sauce or ketchup!")

    ingredient.recipes << recipe

    expect(ingredient.recipes).to eq([recipe])
  end
  end
end

require 'rails_helper'

RSpec.describe Recipe do
  describe '.create' do
    it 'creates a new recipe' do
      expect(Recipe.create()).to be_a Recipe
    end

    it 'is invalid without a title' do
      expect(Recipe.create(title: '', ingredient_list: "1 lb of root veggies, 1 tbsp olive oil, 1/8 tsp ground red pepper, 1/8 tsp garlic powder, 1/2 tsp Worcestershire sauce", instructions: "Preheat oven to 450. In a large bowl combine the sliced vegetables, olive oil, red pepper, garlic powder and Worcestershire and toss to coat well. Lay the vegetables out on a baking sheet in a single layer. Bake for 30 minutes, turning once. Serve the fries hot with your favorite sauce or ketchup!")).not_to be_valid
    end

    it 'is invalid without an ingredient list' do
      expect(Recipe.create(title: 'Garden Fries', ingredient_list: '', instructions: "Preheat oven to 450. In a large bowl combine the sliced vegetables, olive oil, red pepper, garlic powder and Worcestershire and toss to coat well. Lay the vegetables out on a baking sheet in a single layer. Bake for 30 minutes, turning once. Serve the fries hot with your favorite sauce or ketchup!")).not_to be_valid
    end

    it 'is invalid without instructions' do
      expect(Recipe.create(title: 'Garden Fries', ingredient_list: "1 lb of root veggies, 1 tbsp olive oil, 1/8 tsp ground red pepper, 1/8 tsp garlic powder, 1/2 tsp Worcestershire sauce", instructions: '')).not_to be_valid
    end

    it 'is valid with a title, ingredient list, and instructions' do
      expect(Recipe.create(title: 'Garden Fries', ingredient_list: "1 lb of root veggies, 1 tbsp olive oil, 1/8 tsp ground red pepper, 1/8 tsp garlic powder, 1/2 tsp Worcestershire sauce", instructions: "Preheat oven to 450. In a large bowl combine the sliced vegetables, olive oil, red pepper, garlic powder and Worcestershire and toss to coat well. Lay the vegetables out on a baking sheet in a single layer. Bake for 30 minutes, turning once. Serve the fries hot with your favorite sauce or ketchup!")).to be_valid
    end
  end
end

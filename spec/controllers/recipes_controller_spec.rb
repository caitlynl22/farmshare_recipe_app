require 'rails_helper'

RSpec.describe RecipesController do
  let(:valid_attributes) {
    { title: 'Garden Fries', ingredient_list: "1 lb of root veggies, 1 tbsp olive oil, 1/8 tsp ground red pepper, 1/8 tsp garlic powder, 1/2 tsp Worcestershire sauce", instructions: "Preheat oven to 450. In a large bowl combine the sliced vegetables, olive oil, red pepper, garlic powder and Worcestershire and toss to coat well. Lay the vegetables out on a baking sheet in a single layer. Bake for 30 minutes, turning once. Serve the fries hot with your favorite sauce or ketchup!" }
  }

  let(:invalid_attributes) {
    { title: nil, ingredient_list: nil, instructions: nil }
  }

  describe 'GET show' do
    it 'has a 200 status code' do
      ingredient = Ingredient.create!(name: 'Carrots')
      recipe = ingredient.recipes.create!(valid_attributes)
      get :show, id: recipe
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      ingredient = Ingredient.create!(name: 'Carrots')
      recipe = ingredient.recipes.create!(valid_attributes)
      get :show, id: recipe
      expect(response).to render_template('show')
    end

    it 'assigns @recipe' do
      ingredient = Ingredient.create!(name: 'Carrots')
      recipe = ingredient.recipes.create!(valid_attributes)
      get :show, id: recipe
      expect(assigns(:recipe)).to eq recipe
    end

    it 'assigns @comments' do
      ingredient = Ingredient.create!(name: 'Carrots')
      recipe = ingredient.recipes.create!(valid_attributes)
      comments = recipe.comments
      get :show, id: recipe
      expect(assigns(:comments)).to eq comments
    end
  end
end

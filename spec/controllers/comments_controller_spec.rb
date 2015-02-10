require 'rails_helper'

RSpec.describe CommentsController do
  let(:valid_attributes) {
    { name: 'John', body: 'Awesome recipe!' }
  }

  let(:invalid_attributes) {
    { name: nil, body: nil }
  }

  describe 'POST create' do

    context 'with valid attributes' do
      it 'saves a new comment' do
        ingredient = Ingredient.create!(name: 'Carrots')
        recipe = ingredient.recipes.create!(title: 'Garden Fries', ingredient_list: "1 lb of root veggies, 1 tbsp olive oil, 1/8 tsp ground red pepper, 1/8 tsp garlic powder, 1/2 tsp Worcestershire sauce", instructions: "Preheat oven to 450. In a large bowl combine the sliced vegetables, olive oil, red pepper, garlic powder and Worcestershire and toss to coat well. Lay the vegetables out on a baking sheet in a single layer. Bake for 30 minutes, turning once. Serve the fries hot with your favorite sauce or ketchup!")
        expect { post :create, comment: valid_attributes, recipe_id: recipe }.to change(Comment, :count).by 1
      end

      it 'assigns @comment' do
        post :create, comment: valid_attributes
        expect(assigns(:comment)).to be_a Comment
        expect(assigns(:comment)).to be_persisted
      end
    end
  end
end

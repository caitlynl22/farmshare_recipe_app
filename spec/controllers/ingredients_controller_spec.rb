require 'rails_helper'

RSpec.describe IngredientsController do
  let(:valid_attributes) {
    { name: 'Beets' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @ingredients' do
      ingredients = Ingredient.all
      get :index
      expect(assigns(:ingredients)).to eq ingredients
    end
  end

  describe 'GET show' do
    it 'has a 200 status code' do
      ingredient = Ingredient.create!(valid_attributes)
      get :show, id: ingredient
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      ingredient = Ingredient.create!(valid_attributes)
      get :show, id: ingredient
      expect(response).to render_template('show')
    end

    it 'assigns @ingredient' do
      ingredient = Ingredient.create!(valid_attributes)
      get :show, id: ingredient
      expect(assigns(:ingredient)).to eq ingredient
    end

    it 'assigns @recipes' do
      ingredient = Ingredient.create!(valid_attributes)
      recipes = ingredient.recipes
      get :show, id: ingredient
      expect(assigns(:recipes)).to eq recipes
    end

  end
end

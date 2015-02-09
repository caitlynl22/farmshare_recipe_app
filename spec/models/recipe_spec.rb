require 'rails_helper'

RSpec.describe Recipe do
  describe '.create' do
    it 'creates a new recipe' do
      expect(Recipe.create()).to be_a Recipe
    end
  end
end

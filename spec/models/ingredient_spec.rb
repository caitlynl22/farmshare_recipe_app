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
end

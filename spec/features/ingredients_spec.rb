require 'rails_helper'

RSpec.feature 'Managing ingredients' do
  scenario 'List all ingredients' do
    Ingredient.create!(name: 'Beets')
    Ingredient.create!(name: 'Carrots')
    Ingredient.create!(name: 'Kale')

    visit '/ingredients'

    expect(page).to have_content 'Ingredients'
    expect(page).to have_selector 'a', count: 3
  end

  scenario 'Show an ingredient' do
    ingredient = Ingredient.create!(name: 'Beets')

    visit "/ingredients/#{ingredient.id}"

    expect(page).to have_selector 'h1', count: 1
  end
end

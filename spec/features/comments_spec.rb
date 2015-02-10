require 'rails_helper'

RSpec.feature 'Managing comments' do
  scenario 'List all comments associated with a recipe' do

    ingredient = Ingredient.create!(name: 'Carrots')
    recipe = ingredient.recipes.create!(title: 'Garden Fries', ingredient_list: "1 lb of root veggies, 1 tbsp olive oil, 1/8 tsp ground red pepper, 1/8 tsp garlic powder, 1/2 tsp Worcestershire sauce", instructions: "Preheat oven to 450. In a large bowl combine the sliced vegetables, olive oil, red pepper, garlic powder and Worcestershire and toss to coat well. Lay the vegetables out on a baking sheet in a single layer. Bake for 30 minutes, turning once. Serve the fries hot with your favorite sauce or ketchup!")
    comments = Comment.create!([
      {name: 'John', body: 'Awesome recipe!', recipe: recipe},
      {name: 'Jane', body: 'Used soy sauce instead.', recipe: recipe},
      {name: 'Bob Cat', body: 'Not a fan of this one', recipe: recipe}
    ])

    visit "/recipes/#{recipe.id}"

    expect(page).to have_content 'Comments'
    expect(page).to have_selector 'p',
      count: 4
  end
end

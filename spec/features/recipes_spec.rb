require 'rails_helper'

RSpec.feature 'Managing recipes' do
  scenario 'List all recipes associated with an ingredient' do

    ingredient = Ingredient.create!(name: 'Carrots')
    ingredient.recipes.create!([
      {title: 'Curried Carrot and Sweet Potato Soup', ingredient_list: "2 tsp canola oil, 1/2 cup onions, 3 cups peeled and cubed sweet potato, 1 1/2 cups peeled and sliced carrots, 1 Tbsp grated ginger, 2 tsp Curry Powder, 3 cups Vegetable Broth, 1/2 tsp salt, 12 oz Coconut Milk", instructions: "Heat oil in a large saucepan over medium-high heat. Add onions and saute for 3 minutes until tender. Add sweet potatoes, carrots, ginger, curry powder and a little salt. Cook for two minutes longer, stirring occasionally. Gently pour in the vegetable broth and bring soup to a boil. Cover the saucepan, reduce heat, and simmer until the vegetables are tender, about 25 minutes. Turn the heat down to low and slowly stir in the coconut broth, being careful not to let it scorch or separate. Pour half of the soup into a food processor; pulse until smooth. Repeat procedure with remaining soup. Serve warm with fresh cilantro and a wedge of lime."},
      {title: 'Garden Fries', ingredient_list: "1 lb of root veggies, 1 tbsp olive oil, 1/8 tsp ground red pepper, 1/8 tsp garlic powder, 1/2 tsp Worcestershire sauce", instructions: "Preheat oven to 450. In a large bowl combine the sliced vegetables, olive oil, red pepper, garlic powder and Worcestershire and toss to coat well. Lay the vegetables out on a baking sheet in a single layer. Bake for 30 minutes, turning once. Serve the fries hot with your favorite sauce or ketchup!"}
    ])

    visit "/ingredients/#{ingredient.id}"

    expect(page).to have_content 'Recipes'
    expect(page).to have_selector 'section',
      count: 2
  end

  scenario 'Show a specific recipe' do
    ingredient = Ingredient.create!(name: 'Carrots')
    recipe = ingredient.recipes.create!(title: 'Curried Carrot and Sweet Potato Soup', ingredient_list: "2 tsp canola oil, 1/2 cup onions, 3 cups peeled and cubed sweet potato, 1 1/2 cups peeled and sliced carrots, 1 Tbsp grated ginger, 2 tsp Curry Powder, 3 cups Vegetable Broth, 1/2 tsp salt, 12 oz Coconut Milk", instructions: "Heat oil in a large saucepan over medium-high heat. Add onions and saute for 3 minutes until tender. Add sweet potatoes, carrots, ginger, curry powder and a little salt. Cook for two minutes longer, stirring occasionally. Gently pour in the vegetable broth and bring soup to a boil. Cover the saucepan, reduce heat, and simmer until the vegetables are tender, about 25 minutes. Turn the heat down to low and slowly stir in the coconut broth, being careful not to let it scorch or separate. Pour half of the soup into a food processor; pulse until smooth. Repeat procedure with remaining soup. Serve warm with fresh cilantro and a wedge of lime.")

    visit "/recipes/#{recipe.id}"

    expect(page).to have_selector 'h1', count: 1
  end
end

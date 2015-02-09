require 'rails_helper'

RSpec.describe 'routes for recipes' do
  it 'routes GET /recipes/1 to the recipes controller and sets id' do
    expect(get('/recipes/1')).to route_to(
      controller: 'recipes',
      action: 'show',
      id: '1'
    )
  end
end

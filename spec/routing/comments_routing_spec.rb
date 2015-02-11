require 'rails_helper'

RSpec.describe 'routes for comments' do
  it 'routes POST /recipes/:recipe_id/comments' do
    expect(post('/recipes/1/comments')).to route_to(controller: 'comments', action: 'create', recipe_id: '1')
  end

  it 'routes DELETE /recipes/:recipe_id/comments/:id to the comments controller and sets id' do
    expect(delete('recipes/1/comments/1')).to route_to(
      controller: 'comments', action: 'destroy', recipe_id: '1', id: '1')
  end
end

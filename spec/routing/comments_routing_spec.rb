require 'rails_helper'

RSpec.describe 'routes for comments' do
  it 'routes POST /recipes/:recipe_id/comments' do
    expect(post('/recipes/1/comments')).to route_to(controller: 'comments', action: 'create', recipe_id: '1')
  end
end

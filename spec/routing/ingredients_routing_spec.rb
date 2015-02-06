require 'rails_helper'

RSpec.describe 'routes for ingredients' do
  it 'routes GET /ingredients to the ingredients controller' do
    expect(get('/ingredients')).to route_to('ingredients#index')
  end

  it 'routes GET /ingredients/1 to the ingredients controller and sets id' do
    expect(get('/ingredients/1')).to route_to(
      controller: 'ingredients',
      action: 'show',
      id: '1'
    )
  end
end

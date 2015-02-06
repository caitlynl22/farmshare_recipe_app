require 'rails_helper'

RSpec.describe 'routes for ingredients' do
  it 'routes GET /ingredients to the ingredients controller' do
    expect(get('/ingredients')).to route_to('ingredients#index')
  end
end

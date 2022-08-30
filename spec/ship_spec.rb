require 'rspec'
require './lib/ship'

describe Ship do
  it 'exists and has readable attributes' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser).to be_an_instance_of Ship
  end
end

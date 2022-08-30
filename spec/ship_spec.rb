require 'rspec'
require './lib/ship'

describe Ship do
  it 'exists' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser).to be_an_instance_of Ship
  end
end

describe '#name' do
  it 'has readable attributes' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser.name).to eq 'Cruiser'
  end
end

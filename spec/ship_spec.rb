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

describe '#length' do
  it 'has readable attributes' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser.length).to eq 3
  end
end

describe '#health' do
  it 'has readable attributes' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser.health).to eq 3
  end
end

describe '#sunk?' do
  it 'returns true or false' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser.sunk?).to eq false
  end
end

describe '#hit' do
  it 'subtracts 1 from ship_health' do
    cruiser = Ship.new('Cruiser', 3)
    cruiser.hit
    expect(cruiser.health).to eq 2
    cruiser.hit
    cruiser.hit
    expect(cruiser.health).to eq 0
    expect(cruiser.sunk?).to eq true
  end
end

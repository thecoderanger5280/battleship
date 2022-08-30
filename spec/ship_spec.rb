require 'rspec'
require './lib/ship'


describe Ship do
  before(:each) do
  cruiser = Ship.new('Cruiser', 3)

  it 'exists and has readable attributes' do
    expect(cruiser).to be_an_instance_of Ship
    end
  end
  
end

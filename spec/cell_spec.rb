require 'rspec'
#require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    describe '#initialize' do
        it 'exists' do
            cell = Cell.new("B4")

            expect(cell).to be_an_instance_of(Cell)
        end

        it 'can have a ship' do
            cell = Cell.new("B4")

            expect(cell.ship).to eq(nil)
            expect(cell.empty?).to eq(true)
        end
    end
end
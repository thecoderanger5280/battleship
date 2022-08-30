require 'rspec'
require './lib/ship'
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

    describe '#place ship' do
        it 'can add a ship' do
            cell = Cell.new("B4")
            cruiser = Ship.new("Cruiser", 3)

            cell.place_ship(cruiser)
            expect(cell.ship).to eq(cruiser)
            expect(cell.empty?).to eq(false)
        end
    end

    describe '#fired_upon?' do
        it 'can be fired upon' do
            cell = Cell.new("B4")
            cruiser = Ship.new("Cruiser", 3)

            cell.place_ship(cruiser)

            expect(cell.fired_upon?).to eq(false)
            cell.fire_upon
            expect(cell.fired_upon?).to eq(true)
        end
    end

    describe '#render' do
        it 'can display various symbols' do
            cell = Cell.new("B4")
            cell2 = Cell.new("C3")
            cruiser = Ship.new("Cruiser", 3)

            cell2.place_ship(cruiser)

            expect(cell.render).to eq(".")
            cell.fire_upon
            expect(cell.render).to eq("M")
            expect(cell2.render).to eq(".")
            expect(cell2.render(true)).to eq("S")
            cell2.fire_upon
            expect(cell2.render).to eq("H")
            cell2.ship.hit
            cell2.ship.hit
            expect(cell2.render).to eq("X")
        end
    end
end
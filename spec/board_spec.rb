require 'rspec'
require './lib/board'
require './lib/ship'

describe Board do
  it 'exists' do
    board = Board.new()
    expect(board).to be_an_instance_of Board
  end
end

describe '#cells' do
  it 'returns a hash of cells' do
    board = Board.new()
    expect(board.cells).to be_an_instance_of Hash
  end
end

describe '#valid_coordinate?' do
  it 'returns true or false depending or whether coordinate is in hash' do
    board = Board.new()
    expect(board.valid_coordinate?('A1')).to eq true
    expect(board.valid_coordinate?('Z0')).to eq false
  end
end

describe '#valid_placement' do
  it 'checks the ammount of spaces that each ship needs' do
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)
    expect(board.valid_placement?(cruiser, ['A1', 'A2'])).to eq(false)
    expect(board.valid_placement?(submarine, ['A1', 'A2', 'A3'])).to eq(false)
  end

  it 'checks if the coordanites are consecutive' do
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)
    expect(board.valid_placement?(cruiser, ['A1', 'A2', 'A4'])).to eq(false)
    expect(board.valid_placement?(submarine, ['A1', 'C1'])).to eq(false)
    expect(board.valid_placement?(cruiser, ['A3', 'A2', 'A1'])).to eq(true)
    expect(board.valid_placement?(submarine, ['C1', 'B1'])).to eq(false)
  end

  it 'checks if the coordanites are not diagonal' do
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)
    expect(board.valid_placement?(cruiser, ['A3', 'B2', 'C1'])).to eq(false)
    expect(board.valid_placement?(submarine, ['C2', 'D3'])).to eq(false)
  end
end

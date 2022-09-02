require 'rspec'
require './lib/board'

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

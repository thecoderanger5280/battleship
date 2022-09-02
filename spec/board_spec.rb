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

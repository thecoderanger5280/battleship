class Board
  attr_reader :cells
  def initialize
    @cells = {}
    horiz = ["A", "B", "C", "D"]
    vert = ["1", "2", "3", "4"]
    horiz.each do |x|
      vert.each do |y|
        @cells.store(x+y, Cell.new(x+y))
      end
    end
  end
end

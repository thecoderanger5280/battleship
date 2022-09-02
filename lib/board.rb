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

  def valid_coordinate?(coord)
    cells.include?(coord)
  end

  def valid_placement?(ship, coords)
    x_coords = coords.map{|coord| coord[0]}
    y_coords = coords.map{|coord| coord[1]}
    is_valid = !coords.map{|coord| valid_coordinate?(coord)}.include?(false)
    is_horiz = !x_coords.map{|coord| coord == x_coords[0]}.include?(false)
    is_vert = !y_coords.map{|coord| coord == y_coords[0]}.include?(false)
    if ship.length !== coords.length
      is_valid = false
    end
    if is_horiz
      x_sorted = x_coords.sort
      i = 0
      horiz.each do |x|

      end


    end
    y_coords.sort
  end
end

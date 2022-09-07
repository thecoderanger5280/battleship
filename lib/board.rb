require './lib/cell'

class Board
  attr_reader :cells
  def initialize
    @cells = {}
    @horiz = ["A", "B", "C", "D"]
    vert = ["1", "2", "3", "4"]
    @horiz.each do |x|
      vert.each do |y|
        @cells.store(x+y, Cell.new(x+y))
      end
    end
  end

  def valid_coordinate?(coord)
    cells.include?(coord)
  end

  def coords_are_concurrent(coords)
    valid_placement = false
    coords.each_with_index do |coord, i|
      if(i < coords.length - 1)
        if(coords[i + 1] - coord == 1)
          valid_placement = true
        else
          valid_placement = false
        end
      end
    end
    valid_placement
  end

  def placement_occupied?(coords)
    occupied = coords.map {|coord| @cells[coord].empty?}
    occupied.include?(false)
  end

  def valid_placement?(ship, coords)
    if placement_occupied?(coords)
        false
    elsif(ship.length == coords.length)
      letters = coords.map { |coord| coord.slice(0)}
      numbers = coords.map { |coord| coord.slice(1)}
      number_ints = numbers.map { |number| number.to_i}
      letter_ascii = letters.map { |letter| letter.ord}
      if(letters.uniq.length == 1)
        coords_are_concurrent(number_ints)
      elsif(numbers.uniq.length == 1)
        coords_are_concurrent(letter_ascii)
      elsif(numbers.uniq.length != 1 && letters.uniq.length != 1)
        false
      end
    else
      false
    end
  end

  def place(ship, coords)
    if valid_placement?(ship, coords)
      coords.each do |coord|
        @cells[coord].place_ship(ship)
      end
      true
    else
      false
    end
  end

  def render(display = false)
    board_render = "  1 2 3 4 \n"
    if(!display)
      @horiz.each do |coll|
        board_render << "#{coll.slice(0)} "
        lines = @cells.find_all { |cell| coll.slice(0) == cell[0].slice(0)}
        lines.each do |cell|
          board_render << "#{cell[1].render} "
        end
        board_render << "\n"
      end
    else
      @horiz.each do |coll|
        board_render << "#{coll.slice(0)} "
        lines = @cells.find_all { |cell| coll.slice(0) == cell[0].slice(0)}
        lines.each do |cell|
          board_render << "#{cell[1].render(true)} "
        end
        board_render << "\n"
      end
    end
    board_render
  end
end

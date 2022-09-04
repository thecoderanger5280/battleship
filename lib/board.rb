require './cell'

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

  def valid_placement_numbers(number_ints)
    valid_placement = false
    number_ints.each_with_index do |numb, i|
      if(i < number_ints.length - 1)
        if(number_ints[i + 1] - numb == 1)
          valid_placement = true
        else
          valid_placement = false
        end
      end
    end
    valid_placement
  end

  def valid_placement_letters(letter_ascii)
    valid_placement = false
    letter_ascii.each_with_index do |lett, i|
      if(i < letter_ascii.length - 1)
        if(letter_ascii[i + 1] - lett == 1)
          valid_placement = true
        else
          valid_placement = false
        end
      end
    end
    valid_placement
  end

  def valid_placement?(ship, coords)
    if(ship.length == coords.length)
      letters = coords.map { |coord| coord.slice(0)}
      numbers = coords.map { |coord| coord.slice(1)}
      number_ints = numbers.map { |number| number.to_i}
      letter_ascii = letters.map { |letter| letter.ord}
      if(letters.uniq.length == 1)
        valid_placement_numbers(number_ints)
      elsif(numbers.uniq.length == 1)
        valid_placement_letters(letter_ascii)
      elsif(numbers.uniq.length != 1 && letters.uniq.length != 1)
        false
      end
    else
      false
    end
  end
end

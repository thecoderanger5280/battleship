require './lib/board'
require './lib/ship'
require './lib/computer_placement'

class Play
  def start
    p '~*~ Welcome to BATTLESHIP! ~*~'
    p "Enter 'p' to play or 'q' to quit."
    
    correct_input = false
    game_start = false
    while(!correct_input)
      input = gets.chomp.downcase
      if(input == 'p')
        game_start = true
        correct_input = true
      elsif(input == 'q')
        game_start = false
        correct_input = true
      else
        p "Please input 'p' to play or 'q' to quit"
      end
    end
    if(game_start)
      comp_cruiser = Ship.new('Cruiser', 3)
      comp_submarine = Ship.new('Submarine', 2)
      comp_cruiser_place = ComputerPlacement.new(comp_cruiser)
      comp_submarine_place = ComputerPlacement.new(comp_submarine)
      # p comp_cruiser_place.placement
      # p comp_submarine_place.placement
      comp_board = Board.new
      crusier_coords = comp_cruiser_place.placement
      comp_board.place(comp_cruiser, crusier_coords)
      sub_coords = comp_submarine_place.placement
      # if(comp_board.valid_placement(sub_coords))
      until(comp_board.valid_placement?(comp_submarine, sub_coords))
        sub_coords = comp_submarine_place.placement
      end
      comp_board.place(comp_submarine,sub_coords)
      # p sub_coords
      # p crusier_coords
    else
      nil
    end
    # p "#{game_start}"
  end
end

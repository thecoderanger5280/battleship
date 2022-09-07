require './lib/board'
require './lib/ship'
require './lib/computer_placement'

class Play
  def start
    p 'Welcome to BATTLESHIP'
    p "Enter p to play. Enter q to quit."
    unshuffled_coordinates = ['A1','A2','A3','A4','B1','B2','B3','B4','C1','C2','C3','C4','D1','D2','D3','D4',]
    coordinates = unshuffled_coordinates.shuffle
    correct_input = false
    game_start = false
    game_over = false
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
      comp_board = Board.new
      crusier_coords = comp_cruiser_place.placement
      comp_board.place(comp_cruiser, crusier_coords)
      sub_coords = comp_submarine_place.placement
      until(comp_board.valid_placement?(comp_submarine, sub_coords))
        sub_coords = comp_submarine_place.placement
      end
      comp_board.place(comp_submarine,sub_coords)
      player_board = Board.new
      cruiser = Ship.new('Cruiser', 3)
      submarine = Ship.new('Submarine', 2)

      p "I have laid out my ships on the grid."
      p "You now need to lay out your two ships."
      p "The Cruiser is three units long and the"
      p "Submarine is two units long."

      print player_board.render(true)
      
      p "Enter the squares for the Cruiser (3 spaces):"
      player_cruiser = gets.chomp.split(" ")
      until(player_board.valid_placement?(cruiser, player_cruiser))
        p "Those are invalid coordinates. Please try again:"
        player_cruiser = gets.chomp.split(" ")
      end

      player_board.place(cruiser, player_cruiser)

      print player_board.render(true)

      p "Enter the squares for the Cruiser (3 spaces):"
      player_submarine = gets.chomp.split(" ")
      until(player_board.valid_placement?(submarine, player_submarine))
        p "Those are invalid coordinates. Please try again:"
        player_submarine = gets.chomp.split(" ")
      end
      player_board.place(submarine, player_submarine)
      while(!game_over)
        p '=============COMPUTER BOARD============='
        print comp_board.render(true)
        p '==============PLAYER BOARD=============='
        print player_board.render(true)
        p "Enter the coordinate for your shot"
        player_input = gets.chomp
        until(comp_board.valid_coordinate?(player_input))
          p "Please enter a valid coordinate"
        player_input = gets.chomp
        end
        comp_input = coordinates.shift
        comp_board.cells[player_input].fire_upon
        player_board.cells[comp_input].fire_upon
        if(comp_board.cells[player_input].render == 'M')
          p "Your shot on #{player_input} was a miss."
        elsif(comp_board.cells[player_input].render == 'H')
          p "Your shot on #{player_input} was a hit."
        elsif(comp_board.cells[player_input].render == 'X')
          p "Your shot on #{player_input} sunk the ship"
        end
        if(player_board.cells[comp_input].render == 'M')
          p "My shot on #{comp_input} was a miss."
        elsif(player_board.cells[comp_input].render == 'H')
          p "My shot on #{comp_input} was a hit."
        elsif(player_board.cells[comp_input].render == 'X')
          p "My shot on #{comp_input} sunk the ship"
        end
        p "Enter any key to continue"
        gets.chomp
        if(comp_cruiser.health == 0 && comp_submarine.health == 0)
          p "You won!"
          game_over = true
        elsif(cruiser.health == 0 && submarine.health == 0)
          p "I won!"
          game_over = true
        end
      end
    else
      nil
    end
  end
end

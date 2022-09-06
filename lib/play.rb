require './lib/board'
require './lib/ship'
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
    p "#{game_start}"
  end
end

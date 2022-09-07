require './lib/board'
# require './lib/ship'

class ComputerPlacement
  def initialize(ship)
    @ship = ship
  end

  def placement
    if(@ship.length == 3)
      horiz_vert = rand(1..2)
      start_place = rand(1..8)
      if(horiz_vert == 1)
        if(start_place == 1)
          ['A1','A2','A3']
        elsif(start_place == 2)
          ['B1','B2','B3']
       elsif(start_place == 3)
          ['C1','C2','C3']
        elsif(start_place == 4)
          ['D1','D2','D3']
        elsif(start_place == 5)
          ['A2','A3','A4']
        elsif(start_place == 6)
         ['B2','B3','B4']
        elsif(start_place == 7)
          ['C2','C3','C4']
        elsif(start_place == 8)
          ['D2','D3','D4']
        end
      elsif(horiz_vert == 2)
        if(start_place == 1)
          ['A1','B1','C1']
        elsif(start_place == 2)
          ['A2','B2','C2']
        elsif(start_place == 3)
          ['A3','B3','C3']
        elsif(start_place == 4)
          ['A4','B4','C4']
        elsif(start_place == 5)
          ['B1','C1','D1']
        elsif(start_place == 6)
          ['B2','C2','D2']
        elsif(start_place == 7)
          ['B3','C3','D3']
        elsif(start_place == 8)
          ['B4','C4','D4']
        end
      end
    elsif(@ship.length == 2)
      horiz_vert = rand(1..2)
      start_place = rand(1..12)
      if(horiz_vert == 1)
        if(start_place == 1)
          ['A1','A2']
        elsif(start_place == 2)
          ['B1','B2']
        elsif(start_place == 3)
          ['C1','C2']
        elsif(start_place == 4)
          ['D1','D2']
        elsif(start_place == 5)
          ['A2','A3']
        elsif(start_place == 6)
          ['B2','B3']
        elsif(start_place == 7)
          ['C2','C3']
        elsif(start_place == 8)
          ['D2','D3']
        elsif(start_place == 9)
          ['A3','A4']
        elsif(start_place == 10)
          ['B3','B4']
        elsif(start_place == 11)
          ['C3','C4']
        elsif(start_place == 12)
          ['D3','D4']
        end
      elsif(horiz_vert == 2)
        if(start_place == 1)
          ['A1','B1']
        elsif(start_place == 2)
          ['A2','B2']
        elsif(start_place == 3)
          ['A3','B3']
        elsif(start_place == 4)
          ['A4','B4']
        elsif(start_place == 5)
          ['B1','C1']
        elsif(start_place == 6)
          ['B2','C2']
        elsif(start_place == 7)
          ['B3','C3']
        elsif(start_place == 8)
          ['B3','C4']
        elsif(start_place == 9)
          ['C1','D1']
        elsif(start_place == 10)
          ['C2','D2']
        elsif(start_place == 11)
          ['C3','D3']
        elsif(start_place == 12)
          ['C4','D4']
        end
      end
    end
  end
end
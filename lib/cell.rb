class Cell
    attr_reader :coordinate,
                :ship
    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @hit = false
    end

    def empty?
        if(@ship != nil)
            false
        else
            true
        end
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon?
        if(@hit)
            true
        else
            false
        end
    end

    def fire_upon
        @hit = true
        @ship.hit
    end
end
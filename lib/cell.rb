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
        if(@ship != nil)
            @hit = true
            @ship.hit
        else
            @hit = true
        end
    end

    def render(display = false)
        if(@ship == nil)
            if(@hit)
                "M"
            else
                "."
            end
        else
            if(display)
                if(!@hit)
                    "S"
                else
                    if(@ship.sunk?)
                        "X"
                    else
                        "H"
                    end
                end
            else
                if(!@hit)
                    "."
                else
                    if(@ship.sunk?)
                        "X"
                    else
                        "H"
                    end
                end
            end
        end
    end
end
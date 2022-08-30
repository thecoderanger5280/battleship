class Cell
    attr_reader :coordinate,
                :ship
    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
    end

    def empty?
        if(@ship != nil)
            false
        else
            true
        end
    end
end
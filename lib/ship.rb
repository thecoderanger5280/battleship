class Ship
  attr_reader :name, :length
  def initialize(name, length)
    @name = name
    @length = length
    @ship_health = length
  end

  def health
    @ship_health
  end

  def sunk?
    if @ship_health <= 0
      true
    else
      false
    end
  end

  def hit
    @ship_health -=1
  end
end

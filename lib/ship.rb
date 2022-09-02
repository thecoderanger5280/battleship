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
    @ship_health <= 0
  end

  def hit
    @ship_health -=1
  end
end

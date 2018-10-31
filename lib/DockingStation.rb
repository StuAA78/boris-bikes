class DockingStation
  attr_reader :docked_bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @docked_bikes = Array.new
  end

  def release_bike
    empty? ? (fail "No bike docked") : @docked_bikes.first
  end

  def dock(bike)
    full? ? @docked_bikes << bike : (fail "No space")
  end

  private
  def full?
    !!(@docked_bikes.size < DEFAULT_CAPACITY)
  end

  def empty?
    @docked_bikes.empty?
  end
end


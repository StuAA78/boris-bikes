class DockingStation
  attr_reader :docked_bikes

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
    !!(@docked_bikes.size < 20)
  end

  def empty?
    @docked_bikes.empty?
  end
end


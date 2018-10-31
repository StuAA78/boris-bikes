class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = Array.new
  end

  def release_bike
    @docked_bikes.any? ? @docked_bikes.first : (fail "No bike docked")
  end

  def dock(bike)
    @docked_bikes.size < 20 ? @docked_bikes << bike : (fail "No space")
  end

end

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = Array.new
  end

  def release_bike
    @docked_bikes.any? ? @docked_bikes.first : (fail "No bike docked")
  end

  def dock(bike)
#    @docked_bikes ? (fail "No space") : (@docked_bikes = bike)
    if @docked_bikes.size < 20
      @docked_bikes << bike
    else
      raise "No space"
    end
  end
end

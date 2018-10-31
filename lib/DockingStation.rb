class DockingStation
  attr_reader :docked_bike

  def release_bike
    @docked_bike ? Bike.new : (fail "No bike docked")
  end

  def dock(bike)
    @docked_bike ? (fail "No space") : (@docked_bike = bike)
  end
end

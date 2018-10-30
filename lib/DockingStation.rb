class DockingStation
  attr_reader :docked_bike

  def release_bike
    Bike.new
  end

  def dock(bike)
    @docked_bike =  bike
  end
end

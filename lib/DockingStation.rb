class DockingStation
  attr_reader :docked_bikes
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes = Array.new
    @capacity = capacity
  end

  def release_bike
    @docked_bikes.each { |b| return b if b.working? }
    fail "No working bikes docked"
  end

  def dock(bike, broken=false)
    if broken
      bike.broken = true
    end
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

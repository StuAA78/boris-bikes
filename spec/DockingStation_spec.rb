require 'DockingStation'
require 'Bike'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}

  it 'bike is working' do
    bike = Bike.new
    expect(bike.working?).to eq true
  end

  it "bike can be docked" do
    station = DockingStation.new
    expect(station.dock(Bike.new).size).to eq 1
  end

  it "can see a bike that is docked" do
    station = DockingStation.new
    station.dock(Bike.new)
    expect(station.docked_bikes.first).to be_instance_of Bike
  end

  it "can't release a bike if there are none available" do
    expect{subject.release_bike}.to raise_exception
  end

  it "can release a bike if one is docked" do
    station = DockingStation.new
    station.dock(Bike.new)
    expect(station.release_bike).to be_instance_of Bike
  end

  it "can't dock a bike if there is no capacity" do
    station = DockingStation.new
    expect{(DockingStation::DEFAULT_CAPACITY + 1).times { station.dock(Bike.new) } }.to raise_exception
  end

  it "can set a non-default capacity" do
    expect(DockingStation.new(5).capacity).to eq 5
  end

  it "has a default capacity of 20" do
    expect(DockingStation.new.capacity).to eq 20
  end

  it "can report a bike as broken when docking" do
    station = DockingStation.new
    station.dock(Bike.new, true)
    expect(station.docked_bikes.last.broken?).to eq true
  end

  it "does not release a broken bike" do
    station = DockingStation.new
    station.dock(Bike.new, true)
    station.dock(Bike.new)
    expect(station.release_bike.working?).to eq true
  end

  it "does not release any bike if all bikes are broken" do
    station = DockingStation.new
    station.dock(Bike.new, true)
    station.dock(Bike.new, true)
    expect{station.release_bike}.to raise_exception
  end

end

require 'DockingStation'
require 'Bike'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}

  it 'creates a new bike' do
    station = DockingStation.new
    expect(station.release_bike).to be_instance_of Bike
  end

  it 'bike is working' do
    station = DockingStation.new
    bike = station.release_bike
    expect(bike.working?).to eq true
  end

end

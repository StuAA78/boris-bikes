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
    expect(station.dock(Bike.new)).to be_instance_of Bike
  end

  it "can see a bike that is docked" do
    station = DockingStation.new
    station.dock(Bike.new)
    expect(station.docked_bike).to be_instance_of Bike
  end

  it "can't release a bike if there are none available" do
    expect{subject.release_bike}.to raise_exception
  end

  it "can release a bike if one is docked" do
    station = DockingStation.new
    station.dock(Bike.new)
    expect(station.release_bike).to be_instance_of Bike
  end

end

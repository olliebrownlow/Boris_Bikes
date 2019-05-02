require 'docking_station'

# In spec/docking_station_spec.rb
describe DockingStation do


  it 'responds to #release_bike'  do  #=>method
  	#creating an instance of DockingStation
  	station = DockingStation.new
   	expect(station).to respond_to(:release_bike) #=> is : necessary to respresent method??
  end

  it 'gets a working bike' do
  	bike = Bike.new
  	expect(bike.working?).to eq(true)
  end

  it 'responds to #dock' do
  	station = DockingStation.new
    expect(station).to respond_to(:dock).with(1).argument
  end

  it 'responds to #bike' do
  	station = DockingStation.new
  	expect(station).to respond_to(:bike)
  end

  it 'docks something' do
  	bike = Bike.new
  	#station = DockingStation.new
  	expect(DockingStation.new.dock(bike)).to eq(bike)
  end

  it 'returns docked bikes' do
  	bike = Bike.new
  	subject.dock(bike)
  	#subject => is a shortcut to create an instance
    #of the DockingStation class (DockingStation.new)
  	expect(subject.bike).to eq bike

  end

  it 'raise an error when no bikes are available' do
    docking_station = DockingStation.new
    expect {docking_station.release_bike}.to raise_error("No bike available!")
  end
 #  it 'it docks a bike' do
 #  station = DockingStation.new("bike")

 #  #expect(station.dock).to eq(@bike)
 # end
end

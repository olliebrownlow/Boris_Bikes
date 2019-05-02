require 'docking_station'

# In spec/docking_station_spec.rb
describe DockingStation do


  it 'responds to #release_bike'  do  #=>method
  	#creating an instance of DockingStation
  	station = DockingStation.new
   	expect(station).to respond_to(:release_bike) #=> is : necessary to respresent method??
  end

  # let's upgrade our syntax, to:
  # use a '#' before a method name
  # to imply that it is an instance
  # method. Also look: nested describes!
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq(bike)
    end
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
  	expect(station).to respond_to(:bikes)
  end

  describe '#dock' do
    it 'docks something' do
    	bike = Bike.new
    	#station = DockingStation.new
    	expect(DockingStation.new.dock(bike)).to eq [bike]
    end

    it 'raises an error if the docking station is at full capacity' do
      20.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error("Docking station full!")
    end
  end

  it 'returns docked bikes' do
  	bike = Bike.new
  	subject.dock(bike)
  	#subject => is a shortcut to create an instance
    #of the DockingStation class (DockingStation.new)
  	expect(subject.bikes).to eq [bike]

  end

  describe '#release_bike' do
    it 'raise an error when no bikes are available' do
      docking_station = DockingStation.new
      expect {docking_station.release_bike}.to raise_error("No bike available!")
    end
  end

end

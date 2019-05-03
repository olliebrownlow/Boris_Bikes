require 'docking_station'


describe DockingStation do

 describe 'initialization' do

   subject {DockingStation.new}
   let(:bike) {Bike.new}
   it 'defaults capacity' do
     described_class::DEFAULT_CAPACITY.times do
       subject.dock(bike)
     end
     expect{subject.dock(bike)}.to raise_error 'Docking station full!'
   end

   it 'returns a docking station with specified capacity' do
     specified_capacity = DockingStation::DEFAULT_CAPACITY + 5
     expect(DockingStation.new(specified_capacity).capacity).to eq(specified_capacity)
   end


 end

  it 'responds to #release_bike'  do  #=>method
  	#creating an instance of DockingStation
  	station = DockingStation.new
   	expect(station).to respond_to(:release_bike) #=> is : necessary to respresent method??
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq(bike)
    end

    it 'raises an error when we try to release a broken bike' do
      bike = Bike.new
      bike.report_broken
      station = DockingStation.new
      station.dock(bike)
      expect{station.release_bike}.to raise_error('Cannot release broken bike')
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

    it 'can dock a broken bike' do
      bike = Bike.new
      bike.report_broken
      station = DockingStation.new
      station.dock(bike)
      expect(station.bikes).to include(bike)
    end

    it 'raises an error if the docking station is at full capacity' do
      DockingStation.new.capacity.times {subject.dock(Bike.new)}
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

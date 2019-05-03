require_relative 'bike'
class DockingStation
DEFAULT_CAPACITY = 20
attr_accessor :capacity, :bikes



  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail "Docking station full!" if full?
  	@bikes << bike
  end

  def release_bike
   fail "No bike available!" if empty?
   fail "Cannot release broken bike" if @bikes.all?{ |bike| !bike.working?}
   @bikes.pop
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end

# station = DockingStation.new
# bike = Bike.new
# station.dock(bike)

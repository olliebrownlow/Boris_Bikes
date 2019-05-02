require_relative "bike"
class DockingStation
DEFAULT_CAPACITY = 20
attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail "Docking station full!" if full?
  	@bikes << bike
  end

  def release_bike
   fail "No bike available!" if empty?
   @bikes.pop
  end

  private

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end

# station = DockingStation.new
# bike = Bike.new
# station.dock(bike)

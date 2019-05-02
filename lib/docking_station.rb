require_relative "bike"

class DockingStation

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
    @bikes.length >= 20
  end

  def empty?
    @bikes.empty?
  end

end

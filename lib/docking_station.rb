require_relative "bike"

class DockingStation

attr_reader :bike

  def release_bike
   raise "No bike available!"
  end

  def dock(bike)
  	@bike = bike
  end

end

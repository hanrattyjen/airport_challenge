require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather=Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land_plane(plane)
    fail "Plane cannot land as airport is at capacity." if full?
    fail "Plane cannot land, it is too stormy." if Weather.new.stormy?
    fail "This plane has already landed." if plane.landed? == true
    plane.confirm_land
    planes << plane
    planes.last
  end

  def depart_plane(plane)
    fail "Plane cannot take off, it is too stormy." if Weather.new.stormy?
    fail "This plane has already taken off." if plane.landed? == false
    fail "This plane cannot depart from this airport." if planes.include?(plane) == false
    plane.confirm_takeoff
    planes.delete(plane)
    planes
  end

  def list
    planes
  end

  private

  def full?
    planes.count >= capacity
  end
end

require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def confirm_land(plane)
    fail "Plane cannot land as airport is at capacity." if full?
    fail "Plane cannot land, it is too stormy." if stormy?
    planes << plane
    planes.last
  end

  def confirm_takeoff(plane)
    fail "There are no planes in airport." if empty?
    fail "Plane cannot take off, it is too stormy." if stormy?
    planes.shift # this removes and returns the plane object that has taken off
    planes # returns array
  end

  private

  def stormy?
    return true if rand(0..100) == 2
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= capacity
  end
end

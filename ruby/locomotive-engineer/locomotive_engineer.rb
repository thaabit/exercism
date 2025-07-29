class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(wagons, missing_wagons)
    wagons.push(wagons.shift, wagons.shift)
    one = wagons.find_index(1)
    wagons = wagons[0..one] + missing_wagons + wagons[one+1..]
  end

  def self.add_missing_stops(route, **kargs)
    route[:stops] = []
    kargs.sort.each { |_, stop| route[:stops].push(stop) }
    return route
  end

  def self.extend_route_information(route, more_route_information)
    route.merge(more_route_information)
  end
end

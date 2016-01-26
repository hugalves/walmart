class CitySearch
  def initialize(city_id, origin, destiny, city_map=nil, distance=0.0)
    @city_id  = city_id
    @origin   = origin.upcase
    @destiny  = destiny.upcase
    @city_map = city_map
    @distance = distance
  end

  attr_reader   :origin, :destiny, :city_id, :city_map
  attr_accessor :distance

  def lowest_distance
    distances.min
  end

  protected

  def dig_routes_distances
    return by_direct_route          if has_route_to?(destiny)
    return by_city_close_to_citymap if has_route_to?(city_map.origin)
    by_recursion
  end

  private

  def distances
    CityMap.routes_to(city_id, destiny).flat_map do |route|
      CitySearch.new(city_id, origin, destiny, route).dig_routes_distances
    end
  end

  def by_direct_route
    distance_of(route_to(destiny))
  end

  def by_city_close_to_citymap
    self.distance + city_map.distance + distance_of(route_to(city_map.origin))
  end

  def by_recursion
    self.distance += city_map.distance
    routes         = CityMap.routes_to(city_id, city_map.origin)
    routes.map do |route|
      CitySearch.new(city_id, origin, destiny, route, distance).dig_routes_distances
    end
  end

  def distance_of(route)
    route.first.distance
  end

  def has_route_to?(destiny)
    route_to(destiny).any?
  end

  def route_to(destiny)
    CityMap.route_between(city_id, origin, destiny)
  end
end

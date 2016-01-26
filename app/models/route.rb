class Route
  def initialize(city_search, transport)
    @city_search = city_search
    @transport   = transport
  end

  def cost
    best_route_cost.round(2)
  end

  private
  attr_reader :city_search, :transport

  def best_route_cost
    lowest_distance = city_search.lowest_distance

    (transport.fuel_price * lowest_distance) / transport.range_of
  end
end

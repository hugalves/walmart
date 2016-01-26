class RoutesController < ApplicationController
  def find
    city        = City.find_by(name: city_name)
    city_search = CitySearch.new(city.id, origin, destiny)
    transport   = Transport.new(range_of, fuel_price)

    cost = Route.new(city_search, transport).cost

    render json: { cost: cost }
  end

  private

  def city_name
    city_data['name']
  end

  def origin
    city_data['origin']
  end

  def destiny
    city_data['destiny']
  end

  def distance
    city_data['distance']
  end

  def city_data
    routes.fetch('city_data')
  end

  def range_of
    transport['range_of']
  end

  def fuel_price
    transport['fuel_price']
  end

  def transport
    routes.fetch('transport')
  end

  def routes
    params
      .require(:route)
      .permit(
        city_data: [:name, :origin, :destiny, :distance],
        transport: [:range_of, :fuel_price])
  end
end

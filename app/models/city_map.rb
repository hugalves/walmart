class CityMap < ActiveRecord::Base
  has_one :city

  def self.build_and_create_with!(city, params)
    builder = CityMap.builder(city, params)
    CityMap.create!(builder)

  rescue e
    false
  end

  def self.route_between(city_id, origin, destiny)
    CityMap.where(city_id: city_id, origin: origin, destiny: destiny)
  end

  def self.routes_to(city_id, destiny)
    CityMap.where(city_id: city_id, destiny: destiny)
  end

  def self.builder(city, params)
    {
      city_id:  city.id,
      origin:   params.fetch(:origin),
      destiny:  params.fetch(:destiny),
      distance: params.fetch(:distance)
    }
  end
end

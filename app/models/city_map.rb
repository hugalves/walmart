class CityMap < ActiveRecord::Base
  has_one :city

  def self.build_and_create_with!(params)
    city     = City.find_or_create_by!(name: params.fetch(:name))
    builder  = CityMap.builder(city, params)
    city_map = CityMap.find_or_initialize_by(builder.except(:distance))

    city_map.distance = builder[:distance]
    city_map.save!

  rescue => e
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

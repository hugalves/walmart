class CityMap < ActiveRecord::Base
  has_one :city

  #@TODO - Validate if exists
  def self.build_and_create_with!(params)
    CityMap.create!(params)
  end

  def self.route_between(city_id, origin, destiny)
    CityMap.where(city_id: city_id, origin: origin, destiny: destiny)
  end

  def self.routes_to(destiny)
    CityMap.where(destiny: destiny)
  end
end

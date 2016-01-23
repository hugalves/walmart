class CityMap < ActiveRecord::Base
  has_one :city

  def self.route_between(origin, destiny)
    CityMap.where(origin: origin, destiny: destiny)
  end

  def self.routes_to(destiny)
    CityMap.where(destiny: destiny)
  end
end

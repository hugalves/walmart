class City < ActiveRecord::Base
  has_one :city_map

  def self.fetch_save_return!(params)
    city    = City.find_or_create_by!(name: params.fetch('name'))
    builder = city_map_builder(city, params)

    CityMap.build_and_create_with!(builder)
  end

  def self.city_map_builder(city, params)
    {
      city_id:  city.id,
      origin:   params.fetch('origin'),
      destiny:  params.fetch('destiny'),
      distance: params.fetch('distance')
    }
  end
end

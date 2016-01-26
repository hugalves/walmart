class City < ActiveRecord::Base
  has_many :city_maps

  def self.fetch_save_return!(params)
    city = City.find_or_create_by!(name: params.fetch('name'))
    CityMap.build_and_create_with!(city, params)
  end
end

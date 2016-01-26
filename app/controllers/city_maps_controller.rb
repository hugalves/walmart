class CityMapsController < ApplicationController
  def create
    status = CityMap.build_and_create_with!(city_map_params)
    render nothing: true, status: status ? :ok : :internal_error
  end

  private

  def city_map_params
    params
      .require(:map)
      .permit(:name, :origin, :destiny, :distance)
  end
end

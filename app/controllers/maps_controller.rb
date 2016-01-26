class MapsController < ApplicationController
  def create
    status = City.fetch_save_return!(map_params)
    render nothing: true, status: status ? :ok : :unprocessable_entity
  end

  private

  def map_params
    params
      .require(:map)
      .permit(:name, :origin, :destiny, :distance)
  end
end

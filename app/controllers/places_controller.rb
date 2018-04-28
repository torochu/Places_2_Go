class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to places_path
  end
  
  private

  def place_params
    params.require(:place).permit(:name, :description)
  end
  

end

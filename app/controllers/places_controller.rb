class PlacesController < ApplicationController

  def index

    if params[:city]
      @places = Place.where('city LIKE ?', "%#{params[:city]}%")
    else
      @places = Place.all
    end
    #if params[:city].present?
    #  @places = Place.where(city: params[:city])
    #else 
      # @places = Place.all
    #end
    #flash[:dark] = "Title of a longer featured blog post"
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    @place.save!
    redirect_to places_path
  end

  def show
    @place = Place.find(params[:id])
    
  end

  def edit
    @place = Place.find(params[:id])
  end
  
  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to place_path(@place), secondary: "Update successfully"
  end
  
  
  private

  def place_params
    params.require(:place).permit(:name, :description, :city, :district, :address)
  end
  

end

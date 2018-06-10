
class Adm::PlacesController < ApplicationController  
  # dashboard layout
  layout "adm"

  # user must be logged in to access these actions
  before_action :authenticate_user!
  # user must be admin to access
  before_action :admin_required

  def index
    @places = Place.all
    flash[:info] = "Welcome to dashboard"
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
    redirect_to adm_place_path(@place), notice: "更新完成"
  end
  
  
  private

  def place_params
    params.require(:place).permit(:name, :description, :city, :district, :address, :category_id, {images: []})
  end
  

end

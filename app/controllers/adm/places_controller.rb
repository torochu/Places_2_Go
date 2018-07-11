
class Adm::PlacesController < ApplicationController  
  # dashboard layout
  layout "adm"

  # user must be logged in to access these actions
  before_action :authenticate_user!
  # user must be admin to access
  before_action :admin_required

  def index
    @places = Place.where(draft: true)
    flash[:info] = "Welcome to dashboard"
  end

  def published_places
    @places = Place.where(draft: false)
  end

  def new
    @place = Place.new
  end

  def create

    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      redirect_to places_path
    else
      render :new
    end
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

  def publish_this
    @place = Place.find(params[:id])
    @place.to_publish_mode

    redirect_to adm_places_path
  end
  
  
  private

  def place_params
    params.require(:place).permit(:name, :description, :city, :district, :longitude, :latitude, :address, :user_id, :category_id, :booking, :average_cost, :train_distance, :parking, {images: []})
  end
  

end



# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  business_hour  :text
#  comment        :text
#  draft          :boolean          default(TRUE)
#  facility       :text
#  food_ranking   :integer
#  images         :string
#  limitation     :text
#  minimum_order  :string
#  phone          :string
#  recommendation :integer
#  station_nearby :string
#  suitable_age   :string
#  url            :string
#  user_name      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_places_on_category_id  (category_id)
#  index_places_on_user_id      (user_id)
#
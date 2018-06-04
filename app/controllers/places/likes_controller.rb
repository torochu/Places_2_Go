class Places::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place
  
  # http://localhost:3000/places/{place_:id}/like
  def create
    @place.likes.where(user_id: current_user.id).first_or_create
    @place.likes.where(user_id: current_user.id).first_or_create
    respond_to do |format|
      format.html { redirect_to @place }
      format.js
    end
  end

  def destroy
    @place.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @place }
      format.js
    end
  end


private
  def set_place
    @place = Place.find(params[:place_id])
  end

end
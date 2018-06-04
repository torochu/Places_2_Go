class Adm::LikesController < ApplicationController

  layout "adm"
  
  def index
    @likes = Like.where(user_id: current_user.id)
  end
end

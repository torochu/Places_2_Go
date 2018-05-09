class Adm::UsersController < ApplicationController

  layout "adm"
  
  def index
    @users = User.all
  end
end

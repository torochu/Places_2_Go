class PagesController < ApplicationController
  def welcome
    @latest_places = Place.last(5)
  end
end

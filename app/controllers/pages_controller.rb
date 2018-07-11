class PagesController < ApplicationController
  def welcome
    @latest_places = Place.where(draft: false).last(5)
  end
end

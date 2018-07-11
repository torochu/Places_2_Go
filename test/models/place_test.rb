# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  address        :string
#  average_cost   :integer
#  booking        :boolean          default(FALSE)
#  business_hour  :text
#  city           :string
#  comment        :text
#  description    :text
#  district       :string
#  draft          :boolean          default(TRUE)
#  facility       :text
#  food_ranking   :integer
#  images         :string
#  latitude       :float
#  limitation     :text
#  longitude      :float
#  minimum_order  :integer
#  name           :string
#  parking        :integer          default(0)
#  phone          :string
#  recommendation :integer
#  station_nearby :string
#  suitable_age   :integer
#  train_distance :integer
#  url            :string
#  user_name      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :integer
#  user_id        :integer
#
# Indexes
#
#  index_places_on_category_id  (category_id)
#  index_places_on_user_id      (user_id)
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

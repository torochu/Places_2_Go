# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  address        :string
#  average_cost   :string
#  booking        :boolean
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
#  minimum_order  :string
#  name           :string
#  parking        :boolean
#  phone          :string
#  recommendation :integer
#  station_nearby :string
#  suitable_age   :string
#  train_distance :string
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

class Place < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  #belongs_to :city
  has_many :likes

  geocoded_by :full_address
  after_validation :geocode

  mount_uploaders :images, ImageUploader
  serialize :images, JSON

  def full_address
    #  city, district, address
    [TaiwanCity.get(city), TaiwanCity.get(district), address].compact.join
  end
  
end

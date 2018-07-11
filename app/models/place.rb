# == Schema Information
#
# Table name: places
#
#⁄  id             :integer          not null, primary key
#⁄  address        :string
#⁄  average_cost   :integer
#⁄  booking        :boolean          default(FALSE)
#  business_hour  :text
#⁄  city           :string
#⁄  comment        :text
#⁄  description    :text
#⁄  district       :string
#⁄  draft          :boolean          default(TRUE)
#  facility       :text
#  food_ranking   :integer
#⁄  images         :string
#⁄  latitude       :float
#  limitation     :text
#⁄  longitude      :float
#⁄  minimum_order  :integer
#⁄  name           :string
#⁄  parking        :integer          default(0)
#  phone          :string
#  recommendation :integer
#  station_nearby :string
#⁄  suitable_age   :integer
#⁄  train_distance :integer
#  url            :string
#⁄  user_name      :string
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



  # validates :name, presence: true
  # validates :category_id, presence: true
  # validates :city, presence: true
  # validates :district, presence: true
  # validates :parking, presence: true
  # validates :booking, presence: true
  # validates :train_distance, presence: true
  # validates :average_cost, presence: true

  PARKING = %w(無 有 附近有付費停車 附近可停車)
  BOOKING = %w(不需要 需要)
  TRAIN_DIS = %w(無捷運 0~5分鐘 5~10分鐘 10~15分鐘 >15分鐘)
  AVG_COST = %w(免費 $0~$100 $101~$200 $201~$400 $400~$800 >$800)
  SUITABLE_AGE = %w(什麼年紀都好 2歲前 2~6歲 7~12歲)
  MIN_ORDER = %w(無低消 $0~$100 $101~$200 $201~$400 $400~$800 >$800)
  FOOD_RANKING = %w(無 ★勉強 ★★普通 ★★★還可以 ★★★★不錯 ★★★★★很好 ★★★★★★超棒)
  RECOMMENDATION = %w(無 ★勉強 ★★普通 ★★★還可以 ★★★★不錯 ★★★★★很好 ★★★★★★超棒)

  def full_address
    #  city, district, address
    [TaiwanCity.get(city), TaiwanCity.get(district), address].compact.join
  end

  def to_publish_mode
    self.update_columns(draft: false)
  end
  
end

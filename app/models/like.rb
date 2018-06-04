# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :integer
#  user_id    :integer
#

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :place
end

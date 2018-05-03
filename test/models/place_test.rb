# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  address     :string
#  city        :string
#  description :text
#  district    :string
#  name        :string
#  user        :reference
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_places_on_user_id  (user_id)
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

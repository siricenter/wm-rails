# == Schema Information
#
# Table name: amenities
#
#  id          :integer          not null, primary key
#  image_id    :string(255)
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Amenity < ActiveRecord::Base
	validates :image_id, presence: true
	validates :title, presence: true
	validates :description, presence: true
end

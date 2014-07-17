# == Schema Information
#
# Table name: parking_spots
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime
#  updated_at :datetime
#

class ParkingSpot < ActiveRecord::Base
	has_many :contracts

	validates :number, presence: true, numericality: true
end

# == Schema Information
#
# Table name: apartments
#
#  id          :integer          not null, primary key
#  number      :integer
#  bed_count   :integer
#  floor       :integer
#  created_at  :datetime
#  updated_at  :datetime
#  building_id :integer
#

class Apartment < ActiveRecord::Base
	belongs_to :building
	has_many :contracts

	validates :number, presence: true
	validates :bed_count, presence: true, inclusion: { in: [4,6,8] }
	validates :floor, presence: true, inclusion: { in: [1,2,3,4,5] }

	validates_presence_of :building

	def available? semester
		remaining_rooms(semester) >= 1
	end

	def remaining_rooms semester
		bed_count - beds_taken(semester)
	end

	def beds_taken semester
		contracts = Contract.where(apartment: self, semester: semester)

		beds = 0
		contracts.each do |contract|
			beds += contract.beds
		end
		return beds
	end
end

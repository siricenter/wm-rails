# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  capacity   :integer
#

class Building < ActiveRecord::Base
	has_many :apartments
	has_many :contracts
	validates :name, presence: true
	validates :capacity, presence: true, numericality: true
	
	def availabilities? semester
    return self.contracts.joins(:contracts_semesters).where(contracts_semesters: {semester_id: semester.id}).count < self.capacity
	end
end

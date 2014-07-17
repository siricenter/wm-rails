# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Building < ActiveRecord::Base
	has_many :apartments
	validates :name, presence: true
	
	def availabilities? semester
		apartments.each do |apartment|
			return true if apartment.available? semester
		end

		return false
	end
end

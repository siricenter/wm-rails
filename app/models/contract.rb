# == Schema Information
#
# Table name: contracts
#
#  id             :integer          not null, primary key
#  semester_id    :integer
#  apartment_id   :integer
#  first_name     :string(255)
#  last_name      :string(255)
#  email          :string(255)
#  home_address_1 :string(255)
#  home_address_2 :string(255)
#  home_city      :string(255)
#  home_state     :string(255)
#  home_zip       :string(255)
#  room_type      :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  parking_type   :string(255)
#

class ApartmentAvailablityValidator < ActiveModel::Validator
	def validate(record)
        record.errors[:apartment] << "is full" unless record.apartment.available?(record.semester)
    end 
end

class Contract < ActiveRecord::Base
	belongs_to :apartment
	belongs_to :semester

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, format: {with: /@byui.edu/}
	validates :home_address_1, presence: true
	validates :home_city, presence: true
	validates :home_state, presence: true
	validates :home_zip, presence: true
	validates :room_type, presence: true, inclusion: { in: %w(Private Shared) }
	validates :parking_type, presence: true, inclusion: { in: %w(None Covered Uncovered) }

	validates_presence_of :apartment
	validates_presence_of :semester
    
    validates_with ApartmentAvailablityValidator
    
	def beds
		return 1 if room_type == "Shared"
		return 2 if room_type == "Private"
        return 100
	end
end

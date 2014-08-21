# == Schema Information
#
# Table name: contracts
#
#  id                   :integer          not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  email                :string(255)
#  home_address_1       :string(255)
#  home_address_2       :string(255)
#  home_city            :string(255)
#  home_state           :string(255)
#  home_zip             :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  parking_type         :string(255)
#  phone                :string(255)
#  apartment_type       :string(255)
#  building_id          :integer
#  eligibility_sig      :string(255)
#  living_standards_sig :string(255)
#  parking_ack          :string(255)
#  euro                 :string(255)
#  contract_agreement   :string(255)
#  preferences          :text
#  number               :text
#  contract_text_id     :integer
#

class BuildingAvailablityValidator < ActiveModel::Validator
	def validate(record)
    if record.building and not record.semesters.empty?
      record.errors[:building] << "is full" unless record.building.availabilities?(record.semesters.first)
		end
	end 
end

class Contract < ActiveRecord::Base
	has_and_belongs_to_many :semesters, autosave: true
	belongs_to :contract_text
	belongs_to :building

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, format: {with: /@byui.edu/, message: 'A BYU-I email is required'}
	validates :home_address_1, presence: true
	validates :home_city, presence: true
	validates :home_state, presence: true
	validates :home_zip, presence: true
	validates :parking_type, presence: true, inclusion: { in: ['None', 'Tandem Covered', 'Tandem Uncovered', 'Private Covered', 'Private Uncovered'] }
	validates :phone, presence: true
	validates :apartment_type, presence: true, inclusion: { in: ['No Preference', '6 Person', '8 Person'] }
	validates :eligibility_sig, presence: {message: 'Eligibility signature is required'}
	validates :living_standards_sig, presence: {message: 'Living standards signature is required'}
	validates :parking_ack, presence: {message: 'Parking acknowledgement signature is required'}
	validates :contract_agreement, presence: true
	validates :euro, format: { with: /\A(\d\d\d\d|)\z/ }

	validates_presence_of :semesters
	validates_presence_of :building

	validates_with BuildingAvailablityValidator 
end 

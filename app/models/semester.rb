# == Schema Information
#
# Table name: semesters
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  start_date   :date
#  end_date     :date
#  created_at   :datetime
#  updated_at   :datetime
#  private_cost :integer
#  shared_cost  :integer
#  deposit      :integer
#

class DurationValidator < ActiveModel::Validator
	def validate(record)
		unless record.start_date and record.end_date and record.end_date > record.start_date
			record.errors[:duration] << "End date must be after start date" 
		end
	end
end

class Semester < ActiveRecord::Base
	has_many :contracts

	validates :name, presence: true, uniqueness: true
	validates :start_date, presence: true
	validates :end_date, presence: true
    validates :private_cost, presence: true, numericality: true
    validates :shared_cost, presence: true, numericality: true
    validates :deposit, presence: true, numericality: true
    
    validates_with DurationValidator
end

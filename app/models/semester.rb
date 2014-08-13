# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  deposit    :integer
#  rent       :integer
#  duration   :integer
#

class Semester < ActiveRecord::Base
	has_and_belongs_to_many :contracts
	has_one :contract_duration

	validates :name, presence: true, uniqueness: true
    validates :deposit, presence: true, numericality: true
	validates :rent, presence: true, numericality: true
	validates :duration, presence: true, numericality: true

	def start_date
		self.contract_duration.start_date
	end
end

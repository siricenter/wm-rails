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
#  start_date :date
#  end_date   :date
#

class Semester < ActiveRecord::Base
	has_and_belongs_to_many :contracts, dependent: :nullify

	validates :name, presence: true, uniqueness: true
    validates :deposit, presence: true, numericality: true
	validates :rent, presence: true, numericality: true
	validates :start_date, presence: true
	validates :end_date, presence: true

	def payment_due
    self.start_date - 21 # three weeks
	end
end

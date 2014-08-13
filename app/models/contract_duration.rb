# == Schema Information
#
# Table name: contract_durations
#
#  id          :integer          not null, primary key
#  start_date  :date
#  end_date    :date
#  semester_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  payment_due :date
#

class ContractDuration < ActiveRecord::Base
  belongs_to :semester

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :payment_due, presence: true # Date rent payment is due
end

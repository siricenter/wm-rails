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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contract_duration do
    start_date "2014-07-25"
    end_date "2014-07-25"
	payment_due "2014-07-21"
	semester
  end
end

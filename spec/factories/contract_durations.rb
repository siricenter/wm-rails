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
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contract_duration do
    start_date "2014-07-25"
    end_date "2014-07-25"
	semester
  end
end

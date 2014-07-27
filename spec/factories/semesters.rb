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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  	factory :semester do
    	name "Spring Semester 2014"
    	start_date Date.yesterday
    	end_date Date.tomorrow
	  	deposit 50
		rent 1500
  	end
end

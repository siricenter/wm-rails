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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  	factory :semester do
      name {Faker::Name.first_name}
	  	deposit 50
		rent 1500
		duration 1

		after :build do |semester|
			build_list(:contract_duration, 1, semester: semester)
		end

		after :create do |semester|
			create_list(:contract_duration, 1, semester: semester)
		end
  	end
end

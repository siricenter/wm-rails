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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :contract do
		semester
		apartment
		first_name { Faker::Name.first_name } 
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		home_address_1 { Faker::Address.street_address }
		home_address_2 { Faker::Address.secondary_address }
		home_city { Faker::Address.city }
		home_state { Faker::Address.state }
		home_zip { Faker::Address.zip }
		room_type "Shared"
	end
end

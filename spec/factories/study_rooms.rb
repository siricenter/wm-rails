# == Schema Information
#
# Table name: study_rooms
#
#  id          :integer          not null, primary key
#  building_id :integer
#  rm_type     :string(255)
#  rm_number   :integer
#  floor       :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :study_room do
    building nil
    rm_type "MyString"
    rm_number 1
    floor 1
  end
end

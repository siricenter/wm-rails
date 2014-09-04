# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :study_room do
    building
    rm_type "MyString"
    rm_number 1
    floor 1
  end
end

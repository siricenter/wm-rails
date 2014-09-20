# == Schema Information
#
# Table name: beds
#
#  id           :integer          not null, primary key
#  letter       :string(255)
#  apartment_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bed do
    letter "MyString"
    apartment nil
  end
end

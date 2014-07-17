# == Schema Information
#
# Table name: apartments
#
#  id          :integer          not null, primary key
#  number      :integer
#  bed_count   :integer
#  floor       :integer
#  created_at  :datetime
#  updated_at  :datetime
#  building_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :apartment do
    number 301
    bed_count 6
    floor 3
    building 
  end
end

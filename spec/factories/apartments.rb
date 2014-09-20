# == Schema Information
#
# Table name: apartments
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  image_id    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  building_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :apartment do
    title "MyString"
    description "MyText"
    image_id "MyString"
  end
end

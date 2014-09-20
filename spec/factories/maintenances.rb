# == Schema Information
#
# Table name: maintenances
#
#  id           :integer          not null, primary key
#  tenant_name  :string(255)
#  building_id  :integer
#  location     :string(255)
#  description  :string(255)
#  tenant_phone :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :maintenance do
    tenant_name "MyString"
    building_id 1
    location "MyString"
    description "MyString"
    tenant_phone "MyString"
  end
end

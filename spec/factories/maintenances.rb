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

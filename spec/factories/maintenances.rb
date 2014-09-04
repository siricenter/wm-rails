# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :maintenance do
    tenant_name "Jimmy Johns"
    building_id 1
    location "Lobby"
    description "Stain on the carpet"
    tenant_phone "1234567891"
  end
end

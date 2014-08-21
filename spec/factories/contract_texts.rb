# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contract_text do
    contract "MyText"
    living_standards "MyText"
    parking_acknowledgement "MyText"
    eligibility "MyText"
  end
end

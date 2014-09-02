# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :happening do
    heading "MyString"
    description "MyText"
    date "2014-09-02"
  end
end

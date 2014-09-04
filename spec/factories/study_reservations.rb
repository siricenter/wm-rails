# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :study_reservation do
    study_room
    start Time.current
    stop Time.current.end_of_day
    date Date.today
    name "Jimmy John"
  end
end

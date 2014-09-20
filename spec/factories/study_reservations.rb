# == Schema Information
#
# Table name: study_reservations
#
#  id            :integer          not null, primary key
#  study_room_id :integer
#  start         :time
#  stop          :time
#  date          :date
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :study_reservation do
    study_room nil
    start "2014-08-28 19:19:20"
    stop "2014-08-28 19:19:20"
    date "2014-08-28"
    name "MyString"
  end
end

# == Schema Information
#
# Table name: happenings
#
#  id          :integer          not null, primary key
#  heading     :string(255)
#  description :text
#  date        :date
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :happening do
    heading "MyString"
    description "MyText"
    date "2014-09-02"
  end
end

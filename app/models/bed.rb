# == Schema Information
#
# Table name: beds
#
#  id           :integer          not null, primary key
#  letter       :string(255)
#  apartment_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Bed < ActiveRecord::Base
  belongs_to :apartment
  validates_presence_of :apartment
end

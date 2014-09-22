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
  has_many :contracts
  validates_presence_of :apartment

  def available? semester
	  self.contracts & semester.contracts == []
  end
end

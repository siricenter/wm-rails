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

class Maintenance < ActiveRecord::Base
    belongs_to :building
    validates :tenant_name, presence: true
	validates :tenant_phone, presence: true
	validates :building_id, presence: true
	validates :location, presence: true
    validates :description, presence: true

end

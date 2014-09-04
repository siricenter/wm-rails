class Maintenance < ActiveRecord::Base
    belongs_to :building
    
    validates :tenant_name, presence: true
	  validates :tenant_phone, presence: true
	  validates :building_id, presence: true
	  validates :location, presence: true
    validates :description, presence: true

end

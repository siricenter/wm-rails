class Bed < ActiveRecord::Base
  belongs_to :apartment
  validates_presence_of :apartment
end

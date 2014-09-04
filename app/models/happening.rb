class Happening < ActiveRecord::Base
  validates :heading, presence: true
	validates :description, presence: true
end

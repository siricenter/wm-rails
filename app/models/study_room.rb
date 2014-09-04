class StudyRoom < ActiveRecord::Base
  belongs_to :building
  validates :building_id, presence: true
  validates :rm_type, presence: true
  validates :rm_number, presence: true
  validates :floor, presence: true
end

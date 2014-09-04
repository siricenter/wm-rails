class StudyReservation < ActiveRecord::Base
  belongs_to :study_room
  validates :study_room, presence: true
  validates :start, presence: true
  validates :stop, presence: true
  validates :name, presence: true
  validates :date, presence: true
end

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

class StudyReservation < ActiveRecord::Base
  belongs_to :study_room
end

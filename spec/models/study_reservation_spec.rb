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

require 'rails_helper'

RSpec.describe StudyReservation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

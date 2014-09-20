# == Schema Information
#
# Table name: study_rooms
#
#  id          :integer          not null, primary key
#  building_id :integer
#  rm_type     :string(255)
#  rm_number   :integer
#  floor       :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class StudyRoom < ActiveRecord::Base
  belongs_to :building
end

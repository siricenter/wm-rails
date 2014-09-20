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

require 'rails_helper'

RSpec.describe StudyRoom, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

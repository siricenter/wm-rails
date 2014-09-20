# == Schema Information
#
# Table name: happenings
#
#  id          :integer          not null, primary key
#  heading     :string(255)
#  description :text
#  date        :date
#  created_at  :datetime
#  updated_at  :datetime
#

class Happening < ActiveRecord::Base
end

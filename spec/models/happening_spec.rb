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

require 'rails_helper'

RSpec.describe Happening, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

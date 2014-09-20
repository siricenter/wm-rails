# == Schema Information
#
# Table name: beds
#
#  id           :integer          not null, primary key
#  letter       :string(255)
#  apartment_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Bed, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

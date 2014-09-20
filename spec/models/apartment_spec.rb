# == Schema Information
#
# Table name: apartments
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  image_id    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  building_id :integer
#

require 'rails_helper'

RSpec.describe Apartment, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

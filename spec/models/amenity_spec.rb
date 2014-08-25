# == Schema Information
#
# Table name: amenities
#
#  id          :integer          not null, primary key
#  image_id    :string(255)
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Amenity, :type => :model do
  subject {FactoryGirl.build :amenity}
  
  it "has a valid factory" do
		expect(subject).to be_valid
	end
  
end

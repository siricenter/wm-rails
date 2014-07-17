# == Schema Information
#
# Table name: parking_spots
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe ParkingSpot, :type => :model do
	subject { FactoryGirl.build :parking_spot }

	it "has a valid factory" do
		expect(subject).to be_valid
	end

	it "is invalid without a number" do
		subject.number = nil
		expect(subject).to_not be_valid
	end

	it "is invalid if number is not a number" do
		subject.number = 'abc'
		expect(subject).to_not be_valid
	end
end

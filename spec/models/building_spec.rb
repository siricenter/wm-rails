# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Building, :type => :model do
	subject {FactoryGirl.build :building}

	it "has a valid factory" do
		expect(subject).to be_valid
	end

	it "is invalid without a name" do
		subject.name = nil
		expect(subject).to_not be_valid
	end

	describe "availabilities" do
		before :each do
			@semester = FactoryGirl.create :semester
			@apartment = FactoryGirl.create :apartment, building: subject
		end

		it "knows if there is an availability" do
			expect(subject.availabilities?(@semester)).to be true
		end

		it "knows if there's no availability" do
			FactoryGirl.create :contract, semester: @semester, apartment: @apartment, room_type: "Private"
			FactoryGirl.create :contract, semester: @semester, apartment: @apartment, room_type: "Private"
			FactoryGirl.create :contract, semester: @semester, apartment: @apartment, room_type: "Private"
			expect(subject.availabilities?(@semester)).to be false
		end
	end
end

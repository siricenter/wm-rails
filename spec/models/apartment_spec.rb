# == Schema Information
#
# Table name: apartments
#
#  id          :integer          not null, primary key
#  number      :integer
#  bed_count   :integer
#  floor       :integer
#  created_at  :datetime
#  updated_at  :datetime
#  building_id :integer
#

require 'rails_helper'

RSpec.describe Apartment, :type => :model do
	subject {FactoryGirl.build :apartment}

	it "has a valid factory" do
		expect(subject).to be_valid
	end

	it "is invalid without an apartment number" do
		subject.number = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without a  bed count" do
		subject.bed_count = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without a floor number" do
		subject.floor = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without a building" do
		subject.building = nil
		expect(subject).to_not be_valid
	end

	it "is invalid if the bed count is not 4, 6, or 8" do
		subject.bed_count = 5
		expect(subject).to_not be_valid
	end

	it "is invalid if the floor is not 1, 2, 3, 4, or 5" do
		subject.floor = 6
		expect(subject).to_not be_valid
	end


	describe "availability tests" do
		before :each do
			@semester = FactoryGirl.create :semester
			FactoryGirl.create :contract, semester: @semester, apartment: subject
			FactoryGirl.create :contract, semester: @semester, apartment: subject, room_type: "Private"
		end

		it "knows how many beds have been taken in a semester" do
			expect(subject.beds_taken(@semester)).to eq(3)
			expect(subject.remaining_rooms(@semester)).to eq(3)
		end

		it "knows if there is an availability in the apartment" do
			expect(subject.available?(@semester)).to be true
		end

		it "knows if there is not an availability in the apartment" do

			FactoryGirl.create :contract, semester: @semester, apartment: subject
			FactoryGirl.create :contract, semester: @semester, apartment: subject, room_type: "Private"
			expect(subject.available?(@semester)).to be false
		end
	end
end

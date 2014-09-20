# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  capacity   :integer
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

	it "is invalid without a capacity" do
		subject.capacity = nil
		expect(subject).to_not be_valid
	end

	it "is invalid if capacity is not a number" do
		subject.capacity = 'ABC'
		expect(subject).to_not be_valid
	end

	describe "availabilities" do
		before :each do
			@semester = FactoryGirl.create :semester
		end

		it "knows if there is an availability" do
			subject.capacity = 2
			FactoryGirl.create(:contract, building: subject, semesters: [@semester])
			expect(subject.availabilities?(@semester)).to be true
		end

		it "knows if there's no availability" do
			subject.capacity = 1
			FactoryGirl.create(:contract, building: subject, semesters: [@semester])
			expect(subject.availabilities?(@semester)).to be false
		end
	end
end

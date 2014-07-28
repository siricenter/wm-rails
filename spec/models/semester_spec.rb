# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  deposit    :integer
#  rent       :integer
#  duration   :integer
#

require 'rails_helper'

RSpec.describe Semester, :type => :model do
	subject {FactoryGirl.create :semester}

	it "has a valid factory" do
		subject.reload
		expect(subject).to be_valid
		expect(subject.contract_durations.empty?).to be false
	end

	it "is invalid without a name" do
		subject.name = nil
		expect(subject).to_not be_valid
	end

	it "is invalid if semester name is not unique" do
		subject # Subject is lazily loaded, so it's not there if we don't call it
		new_semester = FactoryGirl.build :semester
		expect(new_semester).to_not be_valid
	end

	it "is invalid without rent" do
		subject.rent = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without duration" do
		subject.duration = nil
		expect(subject).to_not be_valid
	end

	it "is invalid if duration is not a number" do
		subject.duration = 'ABC'
		expect(subject).to_not be_valid
	end
end

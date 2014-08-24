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
#  start_date :date
#  end_date   :date
#

require 'rails_helper'

RSpec.describe Semester, :type => :model do
	subject {FactoryGirl.create :semester}

	it "has a valid factory" do
		expect(subject).to be_valid
	end

	it "is invalid without a name" do
		subject.name = nil
		expect(subject).to_not be_valid
	end

	it "is invalid if semester name is not unique" do
		subject # Subject is lazily loaded, so it's not there if we don't call it
    new_semester = FactoryGirl.build(:semester, name: subject.name)
		expect(new_semester).to_not be_valid
	end

	it "is invalid without rent" do
		subject.rent = nil
		expect(subject).to_not be_valid
	end
end

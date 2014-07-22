# == Schema Information
#
# Table name: semesters
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  start_date   :date
#  end_date     :date
#  created_at   :datetime
#  updated_at   :datetime
#  private_cost :integer
#  shared_cost  :integer
#  deposit      :integer
#

require 'rails_helper'

RSpec.describe Semester, :type => :model do
	subject {FactoryGirl.build :semester}

	it "has a valid factory" do
		expect(subject).to be_valid
	end

	it "is invalid without a name" do
		subject.name = nil
		expect(subject).to_not be_valid
	end
	
	it "is invalid without a start date" do
		subject.start_date = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without an end date" do
		subject.end_date = nil
		expect(subject).to_not be_valid
	end

	it "is invalid if the start date is the same as the end date" do
		subject.start_date = Date.today
		subject.end_date = Date.today
		expect(subject).to_not be_valid
	end

	it "is invalid if the start date is after the end date" do
		subject.start_date = Date.today
		subject.end_date = Date.yesterday
		expect(subject).to_not be_valid
	end
    
    it "is invalid without private cost" do
        subject.private_cost = nil
        expect(subject).to_not be_valid
    end
	
	it "is invalid if semester name is not unique" do
		FactoryGirl.create :semester
		subject.should_not be_valid
	end
end

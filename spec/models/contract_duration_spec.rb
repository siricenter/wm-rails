# == Schema Information
#
# Table name: contract_durations
#
#  id          :integer          not null, primary key
#  start_date  :date
#  end_date    :date
#  semester_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  payment_due :date
#

require 'rails_helper'

RSpec.describe ContractDuration, :type => :model do
	subject {FactoryGirl.build :contract_duration}

	it "has a valid factory" do
		expect(subject).to be_valid
	end

	it "is invalid without a start_date" do
		subject.start_date = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without an end date" do
		subject.end_date = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without a payment_due" do
		subject.payment_due = nil
		expect(subject).to_not be_valid
	end
end

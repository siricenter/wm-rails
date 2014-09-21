# == Schema Information
#
# Table name: contracts
#
#  id                   :integer          not null, primary key
#  semester_id          :integer
#  first_name           :string(255)
#  last_name            :string(255)
#  email                :string(255)
#  home_address_1       :string(255)
#  home_address_2       :string(255)
#  home_city            :string(255)
#  home_state           :string(255)
#  home_zip             :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  parking_type         :string(255)
#  phone                :string(255)
#  apartment_type       :string(255)
#  building_id          :integer
#  eligibility_sig      :string(255)
#  living_standards_sig :string(255)
#  parking_ack          :string(255)
#  euro                 :string(255)
#  contract_agreement   :string(255)
#  preferences          :text
#  number               :text
#  contract_text_id     :integer
#

require 'rails_helper'

RSpec.describe Contract, :type => :model do
	subject {FactoryGirl.build :contract}

	it "has a valid factory" do
		expect(subject).to be_valid
	end

	it "is invalid without a first name" do
		subject.first_name = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without a last name" do
		subject.last_name = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without an email" do
		subject.email = nil
		expect(subject).to_not be_valid
	end

	it "is invalid if email is not an @byui.edu email" do
		subject.email = 'CJPoll@gmail.com'
		expect(subject).to_not be_valid
	end

	it "is invalid without a home address 1" do
		subject.home_address_1 = nil
		expect(subject).to_not be_valid
	end

	it "is valid without a home address 2" do
		subject.home_address_2 = nil
		expect(subject).to be_valid
	end

	it "is invalid without a home city" do
		subject.home_city = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without a home state" do
		subject.home_state = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without a home zip" do
		subject.home_zip = nil
		expect(subject).to_not be_valid
	end

    it "is invalid if parking_type is not in the inclusion list" do
        subject.parking_type = "pineapple"
        expect(subject).to_not be_valid
    end

	it "is valid without a building" do
		subject.building = nil
        expect(subject).to be_valid
	end

	it "is invalid without an bed" do
		subject.bed = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without an eligibility_sig" do
		subject.eligibility_sig = nil
        expect(subject).to_not be_valid
	end

	it "is invalid without an living_standards_sig" do
		subject.living_standards_sig = nil
        expect(subject).to_not be_valid
	end

	it "is invalid without an parking_ack" do
		subject.parking_ack = nil
        expect(subject).to_not be_valid
	end

	it "is invalid if the bed is already contracted for the first semester" do
		FactoryGirl.create(:contract, bed: subject.bed, semesters: subject.semesters)
		expect(subject).to_not be_valid
	end

	it "is invalid if the bed is already contracted for a subsequent semester" do
		semester2 = FactoryGirl.create(:semester)
		subject.semesters << semester2
		FactoryGirl.create(:contract, bed: subject.bed, semesters: [subject.semesters.last])
		expect(subject).to_not be_valid
		expect(subject.errors[:bed]).to eq(["is already taken #{semester2.name}"])
	end
end

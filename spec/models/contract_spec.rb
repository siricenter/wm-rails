# == Schema Information
#
# Table name: contracts
#
#  id             :integer          not null, primary key
#  semester_id    :integer
#  apartment_id   :integer
#  first_name     :string(255)
#  last_name      :string(255)
#  email          :string(255)
#  home_address_1 :string(255)
#  home_address_2 :string(255)
#  home_city      :string(255)
#  home_state     :string(255)
#  home_zip       :string(255)
#  room_type      :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  parking_type   :string(255)
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

	it "is invalid without a room type" do
		subject.room_type = nil
		expect(subject).to_not be_valid
	end

    it "is invalid if parking_type is not none covered or uncovered" do
        subject.parking_type = "pineapple"
        expect(subject).to_not be_valid
    end

	it "is invalid if type is not Private or Shared" do
		subject.room_type = "Random"
		expect(subject).to_not be_valid
	end

	it "takes one bed if shared" do
		subject.room_type = "Shared"
		expect(subject.beds).to eq(1)
	end

	it "takes two beds if private" do
		subject.room_type = "Private"
		expect(subject.beds).to eq(2)
	end
    
    it "is invalid if the apartment is full" do
        3.times do
            FactoryGirl.create :contract, apartment: subject.apartment, room_type: 'Private', semester: subject.semester
        end
        saved_contracts = Contract.where(apartment: subject.apartment)                
        subject.apartment.save!
        expect(subject).to_not be_valid
    end
    
end

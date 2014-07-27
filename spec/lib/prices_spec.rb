require 'rails_helper'

RSpec.describe Prices do
	before :each do
		DatabaseCleaner.start
		@semester = FactoryGirl.create :semester
	end

	after :each do
		DatabaseCleaner.clean
	end

	describe "#parking" do
		context "one semester" do
			duration = 1

			it "returns the right price for Private Covered" do
				expect(Prices::parking_price('Private Covered', duration)).to eq(100)
			end

			it "returns the right price for Tandem Covered" do
				expect(Prices::parking_price('Tandem Covered', duration)).to eq(75)
			end

			it "returns the right price for Private Uncovered" do
				expect(Prices::parking_price('Private Uncovered', duration)).to eq(50)
			end

			it "returns the right price for Tandem Uncovered" do
				expect(Prices::parking_price('Tandem Uncovered', duration)).to eq(35)
			end

			it "returns the right price for No Parking" do
				expect(Prices::parking_price('None', duration)).to eq(0)
			end
		end

		context "two semesters" do
			duration = 2

			it "returns the right price for Private Covered" do
				expect(Prices::parking_price('Private Covered', duration)).to eq(185)
			end

			it "returns the right price for Tandem Covered" do
				expect(Prices::parking_price('Tandem Covered', duration)).to eq(140)
			end

			it "returns the right price for Private Uncovered" do
				expect(Prices::parking_price('Private Uncovered', duration)).to eq(90)
			end

			it "returns the right price for Tandem Uncovered" do
				expect(Prices::parking_price('Tandem Uncovered', duration)).to eq(65)
			end

			it "returns the right price for No Parking" do
				expect(Prices::parking_price('None', duration)).to eq(0)
			end
		end

		context "three semesters" do
			duration = 3

			it "returns the right price for Private Covered" do
				expect(Prices::parking_price('Private Covered', duration)).to eq(270)
			end

			it "returns the right price for Tandem Covered" do
				expect(Prices::parking_price('Tandem Covered', duration)).to eq(200)
			end

			it "returns the right price for Private Uncovered" do
				expect(Prices::parking_price('Private Uncovered', duration)).to eq(125)
			end

			it "returns the right price for Tandem Uncovered" do
				expect(Prices::parking_price('Tandem Uncovered', duration)).to eq(90)
			end

			it "returns the right price for No Parking" do
				expect(Prices::parking_price('None', duration)).to eq(0)
			end
		end
	end

	describe "Application Fee" do
		it "returns the correct application fee" do
			expect(Prices::application_fee).to eq(50)
		end
	end

	describe "Deposit" do
		it "returns the correct deposit amount" do
			expect(Prices::deposit(@semester)).to eq(@semester.deposit)
		end
	end

	describe "Rent" do
		it "returns the correct rent amount" do
			expect(Prices::rent(@semester)).to eq(@semester.rent)
		end
	end

	describe "Early Bird" do
		context "one semester" do
			it "should return the correct early bird discount for 1 semester 90 days in advance" do
				expect(Prices::early_bird(@semester, @semester.start_date - 90)).to eq(40)
			end

			it "should return the correct early bird discount for 1 semester 60 days in advance" do
				expect(Prices::early_bird(@semester, @semester.start_date - 60)).to eq(20)
			end

			it "should return the correct early bird discount for 1 semester < 60 days in advance" do
				expect(Prices::early_bird(@semester, @semester.start_date - 59)).to eq(0)
			end
		end

		context "two semesters" do
			before :each do
				@semester.contract_durations << FactoryGirl.build(:contract_duration, semester: @semester)
				@semester.duration = 2
			end

			it "should return the correct early bird discount for 1 semester 90 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semester, @semester.start_date - 90)).to eq([40, 10])
			end

			it "should return the correct early bird discount for 1 semester 60 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semester, @semester.start_date - 60)).to eq([20, 10])
			end

			it "should return the correct early bird discount for 1 semester  < 60 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semester, @semester.start_date - 59)).to eq([0, 0])
			end
		end

		context "whole year"
	end
end

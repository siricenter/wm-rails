require 'rails_helper'

RSpec.describe Prices do
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
end

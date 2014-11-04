require 'rails_helper'

RSpec.describe Prices do
	before :each do
		DatabaseCleaner.start
	end

	after :each do
		DatabaseCleaner.clean
	end

	###
	# Parking
	###
	describe "#parking" do
		context "one semester" do

			before :each do
				@semesters = [FactoryGirl.create(:semester)]
			end

			it "returns the right price for Private Covered" do
				price_array = Prices::parking_price('Private Covered', @semesters)
				expect(price_array).to eq([100])
			end

			it "returns the right price for Tandem Covered" do
				price_array = Prices::parking_price('Tandem Covered', @semesters)
				expect(price_array).to eq([75])
			end

			it "returns the right price for Private Uncovered" do
				price_array = Prices::parking_price('Private Uncovered', @semesters)
				expect(price_array).to eq([50])
			end

			it "returns the right price for Tandem Uncovered" do
				price_array = Prices::parking_price('Tandem Uncovered', @semesters)
				expect(price_array).to eq([35])
			end    
		end


		context "two semesters" do

			before :each do
				@semesters = Array.new()
				2.times do
					@semesters << FactoryGirl.create(:semester)
				end
			end

			it "returns the right price for Private Covered" do
				price_array = Prices::parking_price('Private Covered', @semesters)
				expect(price_array).to eq([100, 85])
			end

			it "returns the right price for Tandem Covered" do
				price_array = Prices::parking_price('Tandem Covered', @semesters)
				expect(price_array).to eq([75, 65])
			end

			it "returns the right price for Private Uncovered" do
				price_array = Prices::parking_price('Private Uncovered', @semesters)
				expect(price_array).to eq([50, 40])
			end

			it "returns the right price for Tandem Uncovered" do
				price_array = Prices::parking_price('Tandem Uncovered', @semesters)
				expect(price_array).to eq([35, 30])
			end    
		end

		context "three semesters" do
			before :each do
				@semesters = Array.new()
				3.times do
					@semesters << FactoryGirl.create(:semester)
				end
			end

			it "returns the right price for Private Covered" do
				price_array = Prices::parking_price('Private Covered', @semesters)
				expect(price_array).to eq([100, 85, 75])
			end

			it "returns the right price for Tandem Covered" do
				price_array = Prices::parking_price('Tandem Covered', @semesters)
				expect(price_array).to eq([75, 65, 60])
			end

			it "returns the right price for Private Uncovered" do
				price_array = Prices::parking_price('Private Uncovered', @semesters)
				expect(price_array).to eq([50, 40, 35])
			end

			it "returns the right price for Tandem Uncovered" do
				price_array = Prices::parking_price('Tandem Uncovered', @semesters)
				expect(price_array).to eq([35, 30, 25])
			end    
		end

		context "four semesters" do
			before :each do
				@semesters = Array.new()
				4.times do
					@semesters << FactoryGirl.create(:semester)
				end
			end

			it "returns the right price for Private Covered" do
				price_array = Prices::parking_price('Private Covered', @semesters)
				expect(price_array).to eq([100, 85, 75, 75])
			end

			it "returns the right price for Tandem Covered" do
				price_array = Prices::parking_price('Tandem Covered', @semesters)
				expect(price_array).to eq([75, 65, 60, 60])
			end

			it "returns the right price for Private Uncovered" do
				price_array = Prices::parking_price('Private Uncovered', @semesters)
				expect(price_array).to eq([50, 40, 35, 35])
			end

			it "returns the right price for Tandem Uncovered" do
				price_array = Prices::parking_price('Tandem Uncovered', @semesters)
				expect(price_array).to eq([35, 30, 25, 25])
			end    
		end


		context "five semesters" do
			before :each do
				@semesters = Array.new()
				5.times do
					@semesters << FactoryGirl.create(:semester)
				end
			end

			it "returns the right price for Private Covered" do
				price_array = Prices::parking_price('Private Covered', @semesters)
				expect(price_array).to eq([100, 85, 75, 75, 75])
			end

			it "returns the right price for Tandem Covered" do
				price_array = Prices::parking_price('Tandem Covered', @semesters)
				expect(price_array).to eq([75, 65, 60, 60, 60])
			end

			it "returns the right price for Private Uncovered" do
				price_array = Prices::parking_price('Private Uncovered', @semesters)
				expect(price_array).to eq([50, 40, 35, 35, 35])
			end

			it "returns the right price for Tandem Uncovered" do
				price_array = Prices::parking_price('Tandem Uncovered', @semesters)
				expect(price_array).to eq([35, 30, 25, 25, 25])
			end    
		end

	end

	###
	# Other prices
	###



	describe "Application Fee" do
		it "returns the correct application fee" do
			expect(Prices::application_fee).to eq(50)
		end
	end

	describe "Deposit" do
		it "returns the correct deposit amount" do
			@semesters = Array.new()
			5.times do
				@semesters << FactoryGirl.create(:semester)
			end
			expect(Prices::deposit(@semesters)).to eq(@semesters.first.deposit)
		end
	end


	describe "Rent" do
		it "returns the correct rent amount" do
			@semesters = Array.new()
			5.times do
				@semesters << FactoryGirl.create(:semester)
			end
			expect(Prices::rent(@semesters)).to eq([1500, 1500, 1500, 1500, 1500])
		end
	end

	describe "Multiple Semester Discounts" do
		it "returns the correct discount for a single semester" do
			@semesters = Array.new()
			1.times do
				@semesters << FactoryGirl.create(:semester)
			end
			expect(Prices::multiple_semester_discounts(@semesters)).to eq([0])
		end

		it "returns the correct discount for two semesters" do
			@semesters = Array.new()
			2.times do
				@semesters << FactoryGirl.create(:semester)
			end
			expect(Prices::multiple_semester_discounts(@semesters)).to eq([0, 95])
		end

		it "returns the correct discount for three semesters" do
			@semesters = Array.new()
			3.times do
				@semesters << FactoryGirl.create(:semester)
			end
			expect(Prices::multiple_semester_discounts(@semesters)).to eq([0, 95, 105])
		end
	end

	###
	# Earyl Bird
	###


	describe "Early Bird" do
		context "one semester" do
			before :each do
				@semesters = Array.new()
				1.times do
					@semesters << FactoryGirl.create(:semester)
				end
			end

			it "should return the correct early bird discount for 1 semester 90 days in advance" do
				today = @semesters.first.start_date - 90
				discount = Prices::early_bird(@semesters, today)
				expect(discount).to eq([ 40 ])
			end

			it "should return the correct early bird discount for 1 semester 60 days in advance" do
				expect(Prices::early_bird(@semesters, @semesters.first.start_date - 60)).to eq([ 20 ])
			end

			it "should return the correct early bird discount for 1 semester < 60 days in advance" do
				expect(Prices::early_bird(@semesters, @semesters.first.start_date - 59)).to eq([ 0 ])
			end
		end

		context "two semesters" do
			before :each do
				@semesters = Array.new()
				2.times do
					@semesters << FactoryGirl.create(:semester)
				end
			end

			it "should return the correct early bird discount for 1 semester 90 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semesters, @semesters.first.start_date - 90)).to eq([40, 10])
			end

			it "should return the correct early bird discount for 1 semester 60 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semesters, @semesters.first.start_date - 60)).to eq([20, 10])
			end

			it "should return the correct early bird discount for 1 semester  < 60 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semesters, @semesters.first.start_date - 59)).to eq([0, 0])
			end
		end

		context "three semesters" do
			before :each do
				@semesters = Array.new()
				3.times do
					@semesters << FactoryGirl.create(:semester)
				end
			end

			it "should return the correct early bird discount for 1 semester 90 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semesters, @semesters.first.start_date - 90)).to eq([40, 10, 10])
			end

			it "should return the correct early bird discount for 1 semester 60 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semesters, @semesters.first.start_date - 60)).to eq([20, 10, 10])
			end

			it "should return the correct early bird discount for 1 semester  < 60 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semesters, @semesters.first.start_date - 59)).to eq([0, 0, 0])
			end      
		end


		context "Use the contact timestamp to do the early bird special" do
			before :each do
				@semesters = Array.new()
				3.times do
					@semesters << FactoryGirl.create(:semester)
				end
				@contract = FactoryGirl.create(:contract, semesters: @semesters)
			end

			it "Should return correct early bird with a contract timestamp listed 90 days before semesters start date" do
				# semester start date is tomorrow, contract was created today, so in order for the date to be 90 days before we subtract 89 days
				expect(Prices::early_bird(@semesters, @contract.created_at.to_date - 89)).to eq([40, 10, 10])
			end

			it "Should return incorrect early bird with a contract timestamp listed 89 days before semesters start date" do
				expect(Prices::early_bird(@semesters, @contract.created_at.to_date - 88)).to_not eq([40, 10, 10])
			end

			it "Should return correct early bird with a contract timestamp listed 60 days before semesters start date" do
				# semester start date is tomorrow, contract was created today, so in order for the date to be 90 days before we subtract 89 days
				expect(Prices::early_bird(@semesters, @contract.created_at.to_date - 59)).to eq([20, 10, 10])
			end

			it "Should return incorrect early bird with a contract timestamp listed 59 days before semesters start date" do
				expect(Prices::early_bird(@semesters, @contract.created_at.to_date - 58)).to_not eq([20, 10, 10])
			end

			it "Should return correct early bird with a contract timestamp listed LESS THAN 60 days before semesters start date" do
				# semester start date is tomorrow, contract was created today, so in order for the date to be 90 days before we subtract 89 days
				expect(Prices::early_bird(@semesters, @contract.created_at.to_date - 58)).to eq([0, 0, 0])
			end

			it "Should return incorrect early bird with a contract timestamp listed MORE THAN 60 days before semesters start date" do
				expect(Prices::early_bird(@semesters, @contract.created_at.to_date - 59)).to_not eq([0, 0, 0])
			end

		end

	end

end

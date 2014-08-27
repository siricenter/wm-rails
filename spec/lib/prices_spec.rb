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

describe "Multiple Semester Discounts" do
		it "returns the correct discount for a single semester" do
			@semester.duration = 1
			expect(Prices::multiple_semester_discounts(@semester)).to eq([0])
		end

  it "returns the correct discount for two semesters" do
			@semester.duration = 2
			expect(Prices::multiple_semester_discounts(@semester)).to eq([0, 95])
		end

		it "returns the correct discount for three semesters" do
			@semester.duration = 3
			expect(Prices::multiple_semester_discounts(@semester)).to eq([0, 95, 105])
		end
	end

###
# Earyl Bird
###


	describe "Early Bird" do
		context "one semester" do
			before :each do
				@semester.duration = 1
		end

			it "should return the correct early bird discount for 1 semester 90 days in advance" do
				today = @semester.start_date - 90
				discount = Prices::early_bird(@semester, today)
				expect(discount).to eq([ 40 ])
			end

			it "should return the correct early bird discount for 1 semester 60 days in advance" do
				expect(Prices::early_bird(@semester, @semester.start_date - 60)).to eq([ 20 ])
			end

			it "should return the correct early bird discount for 1 semester < 60 days in advance" do
				expect(Prices::early_bird(@semester, @semester.start_date - 59)).to eq([ 0 ])
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

		context "whole year" do
			before :each do
				@semester.contract_durations << FactoryGirl.build(:contract_duration, semester: @semester)
				@semester.duration = 3
			end

			it "should return the correct early bird discount for 1 semester 90 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semester, @semester.start_date - 90)).to eq([40, 10, 10])
			end

			it "should return the correct early bird discount for 1 semester 60 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semester, @semester.start_date - 60)).to eq([20, 10, 10])
			end

			it "should return the correct early bird discount for 1 semester  < 60 days in advance for 2 semester contracts" do
				expect(Prices::early_bird(@semester, @semester.start_date - 59)).to eq([0, 0, 0])
		end
		end
	end

end
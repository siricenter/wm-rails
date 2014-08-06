require 'rails_helper'

RSpec.describe "contracts/show", :type => :view do
	before(:each) do
		@contract = assign(:contract, 
						   FactoryGirl.create(:contract,
											  first_name: "First Name",
											  last_name: "Last Name",
											  home_address_1: "Home Address 1",
											  home_address_2: "Home Address 2",
											  home_city: "Home City",
											  home_state: "Home State",
											  home_zip: "Home Zip"))
		@contract.reload
		@semester = @contract.semester
		@application_fee = Prices::application_fee
		@deposit = Prices::deposit(@semester)
		@rent = Prices::rent(@semester)
		@parking = Prices::parking_price(@contract.parking_type, @semester)
		@early_bird = Prices::early_bird(@semester, Date.today)
		@multiple_semesters = Prices::multiple_semester_discounts @semester

		# Calculations
		@parking_price = 0
		@parking.each do |park|
			@parking_price += park
		end
		@early_bird_sum = 0
		@early_bird.each do |early|
			@early_bird_sum += early
		end
		@multiple_semesters_sum = 0
		@multiple_semesters.each do |discount|
			@multiple_semesters_sum += discount
		end

		@euro = 0
		@euro = 50 unless @contract.euro.empty?
		@discounts_total = @early_bird_sum + @multiple_semesters_sum + @euro

		@total = @application_fee + @deposit + @rent * @semester.duration + @parking_price - @discounts_total
	end

	it "renders attributes in <p>" do
		render
		expect(rendered).to match(/First Name/)
		expect(rendered).to match(/Last Name/)
		expect(rendered).to match(/student1@byui.edu/)
		expect(rendered).to match(/Home Address 1/)
		expect(rendered).to match(/Home Address 2/)
		expect(rendered).to match(/Home City/)
		expect(rendered).to match(/Home State/)
		expect(rendered).to match(/Home Zip/)
	end
end

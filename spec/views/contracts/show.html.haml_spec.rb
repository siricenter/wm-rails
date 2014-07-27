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

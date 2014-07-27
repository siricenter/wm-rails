require 'rails_helper'

RSpec.describe "contracts/index", :type => :view do
	before(:each) do
		semester = FactoryGirl.create :semester
		assign(:contracts, [
			FactoryGirl.create(:contract,
							   first_name: "First Name",
							   last_name: "Last Name",
							   home_address_1: "Home Address 1",
							   home_address_2: "Home Address 2",
							   home_city: "Home City",
							   home_state: "Home State",
							   home_zip: "Home Zip",
							   semester: semester),
							   # My text editor indents this part weirdly. Sorry.
							   FactoryGirl.create(:contract,
												  first_name: "First Name",
												  last_name: "Last Name",
												  home_address_1: "Home Address 1",
												  home_address_2: "Home Address 2",
												  home_city: "Home City",
												  home_state: "Home State",
												  home_zip: "Home Zip",
												  semester: semester)
		])
	end

	it "renders a list of contracts" do
		render
		assert_select "tr>td", :text => "First Name".to_s, :count => 2
		assert_select "tr>td", :text => "Last Name".to_s, :count => 2
		assert_select "tr>td", :text => "student1@byui.edu".to_s, :count => 2
		assert_select "tr>td", :text => "Home Address 1".to_s, :count => 2
		assert_select "tr>td", :text => "Home Address 2".to_s, :count => 2
		assert_select "tr>td", :text => "Home City".to_s, :count => 2
		assert_select "tr>td", :text => "Home State".to_s, :count => 2
		assert_select "tr>td", :text => "Home Zip".to_s, :count => 2
	end
end

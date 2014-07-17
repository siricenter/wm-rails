require 'rails_helper'

RSpec.describe "apartments/index", :type => :view do
	before(:each) do
		building = assign(:building, FactoryGirl.create(:building))
		assign(:apartments, [
			FactoryGirl.create(:apartment, building: building),
			FactoryGirl.create(:apartment, building: building)
		])
	end

	it "renders a list of apartments" do
		render
		assert_select "tr>td", :text => 301.to_s, :count => 2
		assert_select "tr>td", :text => 6.to_s, :count => 2
		assert_select "tr>td", :text => 3.to_s, :count => 2
	end
end

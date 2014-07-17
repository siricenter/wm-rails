require 'rails_helper'

RSpec.describe "apartments/show", :type => :view do
	before(:each) do
		@apartment = assign(:apartment, FactoryGirl.create(:apartment))
		assign(:building, @apartment.building)
	end

	it "renders attributes in <p>" do
		render
		expect(rendered).to match(/301/)
		expect(rendered).to match(/6/)
		expect(rendered).to match(/3/)
		expect(rendered).to match(/Windsor Manor Women's/)
	end
end

require 'rails_helper'

RSpec.describe "contracts/success.html.haml", :type => :view do
	before :each do
		@semester = assign(:semester, FactoryGirl.create(:semester))
		@contract = assign(:contract, FactoryGirl.create(:contract, semester: @semester))
		@building = assign(:building, FactoryGirl.create(:building))
		@semester.reload
	end

	it "should render" do
		render
	end
end

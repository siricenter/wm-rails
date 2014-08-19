require 'rails_helper'

RSpec.describe "contracts/success.html.haml", :type => :view do
	before :each do
		@semesters = assign(:semesters, [FactoryGirl.create(:semester)])
		@contract = assign(:contract, FactoryGirl.create(:contract, semesters: @semesters))
		@building = assign(:building, FactoryGirl.create(:building))
	end

	it "should render" do
		render
	end
end

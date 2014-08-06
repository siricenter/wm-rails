require 'rails_helper'

RSpec.describe "contracts/edit", :type => :view do
	before(:each) do
		@semesters = assign(:semesters, [FactoryGirl.create(:semester)])
		@contract = assign(:contract, FactoryGirl.create(:contract, semester: @semesters.first))
		@building = assign(:building, FactoryGirl.create(:building))
	end

	it "renders the edit contract form" do
		render
		# What we care about is that the page is rendering; it's difficult to keep
		# it up to date as views change
	end
end

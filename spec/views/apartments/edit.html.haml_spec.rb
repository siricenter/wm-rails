require 'rails_helper'

RSpec.describe "apartments/edit", :type => :view do
	before(:each) do
		@apartment = assign(:apartment, FactoryGirl.create(:apartment))
		@path = assign(:path, @apartment)
	end

	it "renders the edit apartment form" do
		render

		assert_select "form[action=?][method=?]", apartment_path(@apartment), "post" do

			assert_select "input#apartment_number[name=?]", "apartment[number]"

			assert_select "select#apartment_bed_count[name=?]", "apartment[bed_count]"

			assert_select "select#apartment_floor[name=?]", "apartment[floor]"
		end
	end
end

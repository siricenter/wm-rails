require 'rails_helper'

RSpec.describe "apartments/new", :type => :view do
	before(:each) do
		@apartment = assign(:apartment, FactoryGirl.build(:apartment))
		@building = assign(:building, FactoryGirl.create(:building))
		assign(:path, [@building, @apartment])
	end

	it "renders new apartment form" do
		render

		assert_select "form[action=?][method=?]", building_apartments_path(@building), "post" do

			assert_select "input#apartment_number[name=?]", "apartment[number]"

			assert_select "select#apartment_bed_count[name=?]", "apartment[bed_count]"

			assert_select "select#apartment_floor[name=?]", "apartment[floor]"
		end
	end
end

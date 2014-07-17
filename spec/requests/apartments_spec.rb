require 'rails_helper'

RSpec.describe "Apartments", :type => :request do
	describe "GET /buildings/apartments" do
		it "works! (now write some real specs)" do
			building = FactoryGirl.create :building
			get building_apartments_path(building)
			expect(response.status).to be(200)
		end
	end
end

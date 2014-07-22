require 'rails_helper'

RSpec.describe "Apartments", :type => :request do
	describe "GET /buildings/apartments" do
		it "works! (now write some real specs)" do
			admin = FactoryGirl.create :admin
			post_via_redirect admin_session_path, 'admin[email]' => admin.email, 'admin[password]' => admin.password

#			building = FactoryGirl.create :building
#			get building_apartments_path(building)
			expect(response.status).to be(200)
		end
	end
end

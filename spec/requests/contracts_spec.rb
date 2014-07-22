require 'rails_helper'

RSpec.describe "Contracts", :type => :request do
	describe "GET /contracts" do
		it "works! (now write some real specs)" do
			@admin ||= FactoryGirl.create :admin
			post_via_redirect admin_session_path, 'admin[email]' => @admin.email, 'admin[password]' => @admin.password
			get contracts_path
			expect(response.status).to be(200)
		end
	end
end

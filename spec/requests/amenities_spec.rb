require 'rails_helper'

RSpec.describe "Amenities", :type => :request do
  describe "GET /amenities" do
    it "works! (now write some real specs)" do
      get amenities_path
      expect(response.status).to be(200)
    end
  end
end

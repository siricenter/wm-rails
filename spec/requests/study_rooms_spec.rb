require 'rails_helper'

RSpec.describe "StudyRooms", :type => :request do
  describe "GET /study_rooms" do
    it "works! (now write some real specs)" do
      get study_rooms_path
      expect(response.status).to be(200)
    end
  end
end

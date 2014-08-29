require 'rails_helper'

RSpec.describe "StudyReservations", :type => :request do
  describe "GET /study_reservations" do
    it "works! (now write some real specs)" do
      get study_reservations_path
      expect(response.status).to be(200)
    end
  end
end

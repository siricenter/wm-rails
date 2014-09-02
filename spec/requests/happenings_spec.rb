require 'rails_helper'

RSpec.describe "Happenings", :type => :request do
  describe "GET /happenings" do
    it "works! (now write some real specs)" do
      get happenings_path
      expect(response.status).to be(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "ContractTexts", :type => :request do
  describe "GET /contract_texts" do
    it "works! (now write some real specs)" do
      get contract_texts_path
      expect(response.status).to be(200)
    end
  end
end

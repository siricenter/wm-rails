require "rails_helper"

RSpec.describe ContractTextsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/contract_texts").to route_to("contract_texts#index")
    end

    it "routes to #new" do
      expect(:get => "/contract_texts/new").to route_to("contract_texts#new")
    end

    it "routes to #show" do
      expect(:get => "/contract_texts/1").to route_to("contract_texts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/contract_texts/1/edit").to route_to("contract_texts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/contract_texts").to route_to("contract_texts#create")
    end

    it "routes to #update" do
      expect(:put => "/contract_texts/1").to route_to("contract_texts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/contract_texts/1").to route_to("contract_texts#destroy", :id => "1")
    end

  end
end

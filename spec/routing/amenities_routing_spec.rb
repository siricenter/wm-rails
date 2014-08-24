require "rails_helper"

RSpec.describe AmenitiesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/amenities").to route_to("amenities#index")
    end

    it "routes to #new" do
      expect(:get => "/amenities/new").to route_to("amenities#new")
    end

    it "routes to #show" do
      expect(:get => "/amenities/1").to route_to("amenities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/amenities/1/edit").to route_to("amenities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/amenities").to route_to("amenities#create")
    end

    it "routes to #update" do
      expect(:put => "/amenities/1").to route_to("amenities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/amenities/1").to route_to("amenities#destroy", :id => "1")
    end

  end
end

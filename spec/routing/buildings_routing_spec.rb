require "rails_helper"

RSpec.describe BuildingsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/buildings").to route_to("buildings#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/buildings/new").to route_to("buildings#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/buildings/1").to route_to("buildings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/buildings/1/edit").to route_to("buildings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/buildings").to route_to("buildings#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/buildings/1").to route_to("buildings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/buildings/1").to route_to("buildings#destroy", :id => "1")
    end

  end
end

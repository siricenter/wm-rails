require "rails_helper"

RSpec.describe ApartmentsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/buildings/1/apartments").to route_to("apartments#index", building_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/admin/buildings/1/apartments/new").to route_to("apartments#new", building_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/admin/apartments/1").to route_to("apartments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/apartments/1/edit").to route_to("apartments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/buildings/1/apartments").to route_to("apartments#create", building_id: '1')
    end

    it "routes to #update" do
      expect(:put => "/admin/apartments/1").to route_to("apartments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/apartments/1").to route_to("apartments#destroy", :id => "1")
    end

  end
end

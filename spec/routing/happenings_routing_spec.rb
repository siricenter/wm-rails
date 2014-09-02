require "rails_helper"

RSpec.describe HappeningsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/happenings").to route_to("happenings#index")
    end

    it "routes to #new" do
      expect(:get => "/happenings/new").to route_to("happenings#new")
    end

    it "routes to #show" do
      expect(:get => "/happenings/1").to route_to("happenings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/happenings/1/edit").to route_to("happenings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/happenings").to route_to("happenings#create")
    end

    it "routes to #update" do
      expect(:put => "/happenings/1").to route_to("happenings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/happenings/1").to route_to("happenings#destroy", :id => "1")
    end

  end
end

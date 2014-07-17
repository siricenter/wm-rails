require "rails_helper"

RSpec.describe ContractsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/contracts").to route_to("contracts#index")
    end

    it "routes to #new" do
      expect(:get => "/contracts/new/1").to route_to("contracts#new", building_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/admin/contracts/1").to route_to("contracts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/contracts/1/edit").to route_to("contracts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/contracts").to route_to("contracts#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/contracts/1").to route_to("contracts#update", :id => "1")
    end

	# We're not currently exposing the destroy contact functionality. The tests
	# are here in case we ever do.
	#
    #it "routes to #destroy" do
    #  expect(:delete => "/contracts/1").to route_to("contracts#destroy", :id => "1")
    #end

  end
end

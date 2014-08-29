require "rails_helper"

RSpec.describe StudyReservationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/study_reservations").to route_to("study_reservations#index")
    end

    it "routes to #new" do
      expect(:get => "/study_reservations/new").to route_to("study_reservations#new")
    end

    it "routes to #show" do
      expect(:get => "/study_reservations/1").to route_to("study_reservations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/study_reservations/1/edit").to route_to("study_reservations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/study_reservations").to route_to("study_reservations#create")
    end

    it "routes to #update" do
      expect(:put => "/study_reservations/1").to route_to("study_reservations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/study_reservations/1").to route_to("study_reservations#destroy", :id => "1")
    end

  end
end

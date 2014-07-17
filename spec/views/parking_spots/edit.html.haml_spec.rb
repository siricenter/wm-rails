require 'rails_helper'

RSpec.describe "parking_spots/edit", :type => :view do
  before(:each) do
    @parking_spot = assign(:parking_spot, ParkingSpot.create!(
      :number => 1
    ))
  end

  it "renders the edit parking_spot form" do
    render

    assert_select "form[action=?][method=?]", parking_spot_path(@parking_spot), "post" do

      assert_select "input#parking_spot_number[name=?]", "parking_spot[number]"
    end
  end
end

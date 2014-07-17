require 'rails_helper'

RSpec.describe "parking_spots/index", :type => :view do
  before(:each) do
    assign(:parking_spots, [
      ParkingSpot.create!(
        :number => 1
      ),
      ParkingSpot.create!(
        :number => 1
      )
    ])
  end

  it "renders a list of parking_spots" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

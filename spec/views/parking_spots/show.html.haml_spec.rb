require 'rails_helper'

RSpec.describe "parking_spots/show", :type => :view do
  before(:each) do
    @parking_spot = assign(:parking_spot, ParkingSpot.create!(
      :number => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end

require 'rails_helper'

RSpec.describe "parking_spots/new", :type => :view do
  before(:each) do
    assign(:parking_spot, ParkingSpot.new(
      :number => 1
    ))
  end

  it "renders new parking_spot form" do
    render

    assert_select "form[action=?][method=?]", parking_spots_path, "post" do

      assert_select "input#parking_spot_number[name=?]", "parking_spot[number]"
    end
  end
end

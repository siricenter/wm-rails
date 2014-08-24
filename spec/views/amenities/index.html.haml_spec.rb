require 'rails_helper'

RSpec.describe "amenities/index", :type => :view do
  before(:each) do
    assign(:amenities, [
      Amenity.create!(
        :image_id => "Image",
        :title => "Title",
        :description => "MyText"
      ),
      Amenity.create!(
        :image_id => "Image",
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of amenities" do
    render
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

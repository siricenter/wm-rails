require 'rails_helper'

RSpec.describe "amenities/index", :type => :view do
  before(:each) do
    assign(:amenities, [
      Amenity.create!(
        :title => "Title",
        :img_id => "Img",
        :img_desc => "Img Desc"
      ),
      Amenity.create!(
        :title => "Title",
        :img_id => "Img",
        :img_desc => "Img Desc"
      )
    ])
  end

  it "renders a list of amenities" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
    assert_select "tr>td", :text => "Img Desc".to_s, :count => 2
  end
end

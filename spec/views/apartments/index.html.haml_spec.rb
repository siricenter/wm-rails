require 'rails_helper'

RSpec.describe "apartments/index", :type => :view do
  before(:each) do
    assign(:apartments, [
      Apartment.create!(
        :title => "Title",
        :description => "MyText",
        :image_id => "Image"
      ),
      Apartment.create!(
        :title => "Title",
        :description => "MyText",
        :image_id => "Image"
      )
    ])
  end

  it "renders a list of apartments" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end

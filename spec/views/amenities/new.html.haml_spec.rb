require 'rails_helper'

RSpec.describe "amenities/new", :type => :view do
  before(:each) do
    assign(:amenity, Amenity.new(
      :image_id => "MyString",
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new amenity form" do
    render

    assert_select "form[action=?][method=?]", amenities_path, "post" do

      assert_select "input#amenity_image_id[name=?]", "amenity[image_id]"

      assert_select "input#amenity_title[name=?]", "amenity[title]"

      assert_select "textarea#amenity_description[name=?]", "amenity[description]"
    end
  end
end

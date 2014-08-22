require 'rails_helper'

RSpec.describe "amenities/new", :type => :view do
  before(:each) do
    assign(:amenity, Amenity.new(
      :title => "MyString",
      :img_id => "MyString",
      :img_desc => "MyString"
    ))
  end

  it "renders new amenity form" do
    render

    assert_select "form[action=?][method=?]", amenities_path, "post" do

      assert_select "input#amenity_title[name=?]", "amenity[title]"

      assert_select "input#amenity_img_id[name=?]", "amenity[img_id]"

      assert_select "input#amenity_img_desc[name=?]", "amenity[img_desc]"
    end
  end
end

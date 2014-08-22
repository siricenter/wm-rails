require 'rails_helper'

RSpec.describe "amenities/edit", :type => :view do
  before(:each) do
    @amenity = assign(:amenity, Amenity.create!(
      :title => "MyString",
      :img_id => "MyString",
      :img_desc => "MyString"
    ))
  end

  it "renders the edit amenity form" do
    render

    assert_select "form[action=?][method=?]", amenity_path(@amenity), "post" do

      assert_select "input#amenity_title[name=?]", "amenity[title]"

      assert_select "input#amenity_img_id[name=?]", "amenity[img_id]"

      assert_select "input#amenity_img_desc[name=?]", "amenity[img_desc]"
    end
  end
end

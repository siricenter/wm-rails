require 'rails_helper'

RSpec.describe "amenities/edit", :type => :view do
  before(:each) do
    @amenity = assign(:amenity, Amenity.create!(
      :image_id => "MyString",
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit amenity form" do
    render

    assert_select "form[action=?][method=?]", amenity_path(@amenity), "post" do

      assert_select "input#amenity_image_id[name=?]", "amenity[image_id]"

      assert_select "input#amenity_title[name=?]", "amenity[title]"

      assert_select "textarea#amenity_description[name=?]", "amenity[description]"
    end
  end
end

require 'rails_helper'

RSpec.describe "galleries/new", :type => :view do
  before(:each) do
    assign(:gallery, Gallery.new(
      :image_id => "MyString",
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new gallery form" do
    render

    assert_select "form[action=?][method=?]", galleries_path, "post" do

      assert_select "input#gallery_image_id[name=?]", "gallery[image_id]"

      assert_select "input#gallery_title[name=?]", "gallery[title]"

      assert_select "textarea#gallery_description[name=?]", "gallery[description]"
    end
  end
end

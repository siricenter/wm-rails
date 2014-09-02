require 'rails_helper'

RSpec.describe "apartments/new", :type => :view do
  before(:each) do
    assign(:apartment, Apartment.new(
      :title => "MyString",
      :description => "MyText",
      :image_id => "MyString"
    ))
  end

  it "renders new apartment form" do
    render

    assert_select "form[action=?][method=?]", apartments_path, "post" do

      assert_select "input#apartment_title[name=?]", "apartment[title]"

      assert_select "textarea#apartment_description[name=?]", "apartment[description]"

      assert_select "input#apartment_image_id[name=?]", "apartment[image_id]"
    end
  end
end

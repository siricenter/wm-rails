require 'rails_helper'

RSpec.describe "apartments/edit", :type => :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :title => "MyString",
      :description => "MyText",
      :image_id => "MyString"
    ))
  end

  it "renders the edit apartment form" do
    render

    assert_select "form[action=?][method=?]", apartment_path(@apartment), "post" do

      assert_select "input#apartment_title[name=?]", "apartment[title]"

      assert_select "textarea#apartment_description[name=?]", "apartment[description]"

      assert_select "input#apartment_image_id[name=?]", "apartment[image_id]"
    end
  end
end

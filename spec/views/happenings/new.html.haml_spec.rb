require 'rails_helper'

RSpec.describe "happenings/new", :type => :view do
  before(:each) do
    assign(:happening, Happening.new(
      :heading => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new happening form" do
    render

    assert_select "form[action=?][method=?]", happenings_path, "post" do

      assert_select "input#happening_heading[name=?]", "happening[heading]"

      assert_select "textarea#happening_description[name=?]", "happening[description]"
    end
  end
end

require 'rails_helper'

RSpec.describe "happenings/edit", :type => :view do
  before(:each) do
    @happening = assign(:happening, Happening.create!(
      :heading => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit happening form" do
    render

    assert_select "form[action=?][method=?]", happening_path(@happening), "post" do

      assert_select "input#happening_heading[name=?]", "happening[heading]"

      assert_select "textarea#happening_description[name=?]", "happening[description]"
    end
  end
end

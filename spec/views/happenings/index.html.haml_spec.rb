require 'rails_helper'

RSpec.describe "happenings/index", :type => :view do
  before(:each) do
    assign(:happenings, [
      Happening.create!(
        :heading => "Heading",
        :description => "MyText"
      ),
      Happening.create!(
        :heading => "Heading",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of happenings" do
    render
    assert_select "tr>td", :text => "Heading".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

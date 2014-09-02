require 'rails_helper'

RSpec.describe "happenings/show", :type => :view do
  before(:each) do
    @happening = assign(:happening, Happening.create!(
      :heading => "Heading",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Heading/)
    expect(rendered).to match(/MyText/)
  end
end

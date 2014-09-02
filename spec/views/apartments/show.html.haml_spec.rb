require 'rails_helper'

RSpec.describe "apartments/show", :type => :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :title => "Title",
      :description => "MyText",
      :image_id => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
  end
end

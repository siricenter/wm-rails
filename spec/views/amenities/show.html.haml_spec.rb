require 'rails_helper'

RSpec.describe "amenities/show", :type => :view do
  before(:each) do
    @amenity = assign(:amenity, Amenity.create!(
      :image_id => "Image",
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end

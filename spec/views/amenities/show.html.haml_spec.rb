require 'rails_helper'

RSpec.describe "amenities/show", :type => :view do
  before(:each) do
    @amenity = assign(:amenity, Amenity.create!(
      :title => "Title",
      :img_id => "Img",
      :img_desc => "Img Desc"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Img/)
    expect(rendered).to match(/Img Desc/)
  end
end

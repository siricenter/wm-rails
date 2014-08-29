require 'rails_helper'

RSpec.describe "galleries/show", :type => :view do
  before(:each) do
    @gallery = assign(:gallery, Gallery.create!(
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

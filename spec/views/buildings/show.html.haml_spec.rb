require 'rails_helper'

RSpec.describe "buildings/show", :type => :view do
  before(:each) do
    @building = assign(:building, FactoryGirl.create(:building))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Windsor Manor Women's/)
  end
end

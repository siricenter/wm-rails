require 'rails_helper'

RSpec.describe "buildings/index", :type => :view do
  before(:each) do
    assign(:buildings, [
		FactoryGirl.create(:building),
		FactoryGirl.create(:building)
    ])
  end

  it "renders a list of buildings" do
    render
    assert_select "tr>td", :text => "Windsor Manor Women's".to_s, :count => 2
  end
end

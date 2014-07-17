require 'rails_helper'

RSpec.describe "semesters/index", :type => :view do
  before(:each) do
    assign(:semesters, [
		FactoryGirl.create(:semester),
		FactoryGirl.create(:semester)
    ])
  end

  it "renders a list of semesters" do
    render
    assert_select "tr>td", :text => "Spring Semester 2014".to_s, :count => 2
  end
end

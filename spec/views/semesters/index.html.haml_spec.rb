require 'rails_helper'

RSpec.describe "semesters/index", :type => :view do
  before(:each) do
    assign(:semesters, [
		FactoryGirl.create(:semester),
		FactoryGirl.create(:semester, name: 'Semester 2')
    ])
  end

  it "renders a list of semesters" do
    render
    assert_select "tr>td", :text => "Spring Semester 2014".to_s, :count => 1
    assert_select "tr>td", :text => "Semester 2".to_s, :count => 1
  end
end

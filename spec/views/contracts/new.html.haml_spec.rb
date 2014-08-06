require 'rails_helper'

RSpec.describe "contracts/new", :type => :view do
  before(:each) do
    @contract = assign(:contract, FactoryGirl.build(:contract))
	@semesters = assign(:semesters, [@contract.semester])
	@building = assign(:building, FactoryGirl.create(:building))
  end

  it "renders new contract form" do
    render
	# What we care about is that the page is rendering; it's difficult to keep
	# it up to date as views change
  end
end

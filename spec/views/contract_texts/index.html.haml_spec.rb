require 'rails_helper'

RSpec.describe "contract_texts/index", :type => :view do
  before(:each) do
    assign(:contract_texts, [
      ContractText.create!(
        :contract => "MyText",
        :living_standards => "MyText",
        :parking_acknowledgement => "MyText",
        :eligibility => "MyText"
      ),
      ContractText.create!(
        :contract => "MyText",
        :living_standards => "MyText",
        :parking_acknowledgement => "MyText",
        :eligibility => "MyText"
      )
    ])
  end

  it "renders a list of contract_texts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

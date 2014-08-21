require 'rails_helper'

RSpec.describe "contract_texts/show", :type => :view do
  before(:each) do
    @contract_text = assign(:contract_text, ContractText.create!(
      :contract => "MyText",
      :living_standards => "MyText",
      :parking_acknowledgement => "MyText",
      :eligibility => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end

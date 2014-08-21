require 'rails_helper'

RSpec.describe "contract_texts/edit", :type => :view do
  before(:each) do
    @contract_text = assign(:contract_text, ContractText.create!(
      :contract => "MyText",
      :living_standards => "MyText",
      :parking_acknowledgement => "MyText",
      :eligibility => "MyText"
    ))
  end

  it "renders the edit contract_text form" do
    render

    assert_select "form[action=?][method=?]", contract_text_path(@contract_text), "post" do

      assert_select "textarea#contract_text_contract[name=?]", "contract_text[contract]"

      assert_select "textarea#contract_text_living_standards[name=?]", "contract_text[living_standards]"

      assert_select "textarea#contract_text_parking_acknowledgement[name=?]", "contract_text[parking_acknowledgement]"

      assert_select "textarea#contract_text_eligibility[name=?]", "contract_text[eligibility]"
    end
  end
end

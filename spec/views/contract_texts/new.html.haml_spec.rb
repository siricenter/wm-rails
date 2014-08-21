require 'rails_helper'

RSpec.describe "contract_texts/new", :type => :view do
  before(:each) do
    assign(:contract_text, ContractText.new(
      :contract => "MyText",
      :living_standards => "MyText",
      :parking_acknowledgement => "MyText",
      :eligibility => "MyText"
    ))
  end

  it "renders new contract_text form" do
    render

    assert_select "form[action=?][method=?]", contract_texts_path, "post" do

      assert_select "textarea#contract_text_contract[name=?]", "contract_text[contract]"

      assert_select "textarea#contract_text_living_standards[name=?]", "contract_text[living_standards]"

      assert_select "textarea#contract_text_parking_acknowledgement[name=?]", "contract_text[parking_acknowledgement]"

      assert_select "textarea#contract_text_eligibility[name=?]", "contract_text[eligibility]"
    end
  end
end

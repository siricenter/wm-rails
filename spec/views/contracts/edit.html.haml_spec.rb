require 'rails_helper'

RSpec.describe "contracts/edit", :type => :view do
  before(:each) do
	@semesters = assign(:semesters, [FactoryGirl.create(:semester)])
    @contract = assign(:contract, FactoryGirl.create(:contract, semester: @semesters.first))
	@building = assign(:building, FactoryGirl.create(:building))
  end

  it "renders the edit contract form" do
    render

    assert_select "form[action=?][method=?]", discounts_path, "post" do

      assert_select "input#contract_first_name[name=?]", "contract[first_name]"

      assert_select "input#contract_last_name[name=?]", "contract[last_name]"

      assert_select "input#contract_email[name=?]", "contract[email]"

      assert_select "input#contract_home_address_1[name=?]", "contract[home_address_1]"

      assert_select "input#contract_home_address_2[name=?]", "contract[home_address_2]"

      assert_select "input#contract_home_city[name=?]", "contract[home_city]"

      assert_select "input#contract_home_state[name=?]", "contract[home_state]"

      assert_select "input#contract_home_zip[name=?]", "contract[home_zip]"

    end
  end
end

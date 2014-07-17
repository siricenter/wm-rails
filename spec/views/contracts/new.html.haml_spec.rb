require 'rails_helper'

RSpec.describe "contracts/new", :type => :view do
  before(:each) do
    assign(:contract, Contract.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :home_address_1 => "MyString",
      :home_address_2 => "MyString",
      :home_city => "MyString",
      :home_state => "MyString",
      :home_zip => "MyString",
      :room_type => "MyString"
    ))
  end

  it "renders new contract form" do
    render

    assert_select "form[action=?][method=?]", contracts_path, "post" do

      assert_select "input#contract_first_name[name=?]", "contract[first_name]"

      assert_select "input#contract_last_name[name=?]", "contract[last_name]"

      assert_select "input#contract_email[name=?]", "contract[email]"

      assert_select "input#contract_home_address_1[name=?]", "contract[home_address_1]"

      assert_select "input#contract_home_address_2[name=?]", "contract[home_address_2]"

      assert_select "input#contract_home_city[name=?]", "contract[home_city]"

      assert_select "input#contract_home_state[name=?]", "contract[home_state]"

      assert_select "input#contract_home_zip[name=?]", "contract[home_zip]"

      assert_select "input#contract_room_type[name=?]", "contract[room_type]"
    end
  end
end

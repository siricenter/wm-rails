require 'rails_helper'

RSpec.describe "maintenances/new", :type => :view do
  before(:each) do
    assign(:maintenance, Maintenance.new(
      :tenant_name => "MyString",
      :building_id => 1,
      :location => "MyString",
      :description => "MyString",
      :tenant_phone => "MyString"
    ))
  end

  it "renders new maintenance form" do
    render

    assert_select "form[action=?][method=?]", maintenances_path, "post" do

      assert_select "input#maintenance_tenant_name[name=?]", "maintenance[tenant_name]"

      assert_select "input#maintenance_building_id[name=?]", "maintenance[building_id]"

      assert_select "input#maintenance_location[name=?]", "maintenance[location]"

      assert_select "input#maintenance_description[name=?]", "maintenance[description]"

      assert_select "input#maintenance_tenant_phone[name=?]", "maintenance[tenant_phone]"
    end
  end
end

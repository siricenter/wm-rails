require 'rails_helper'

RSpec.describe "maintenances/index", :type => :view do
  before(:each) do
    assign(:maintenances, [
      Maintenance.create!(
        :tenant_name => "Tenant Name",
        :building_id => 1,
        :location => "Location",
        :description => "Description",
        :tenant_phone => "Tenant Phone"
      ),
      Maintenance.create!(
        :tenant_name => "Tenant Name",
        :building_id => 1,
        :location => "Location",
        :description => "Description",
        :tenant_phone => "Tenant Phone"
      )
    ])
  end

  it "renders a list of maintenances" do
    render
    assert_select "tr>td", :text => "Tenant Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Tenant Phone".to_s, :count => 2
  end
end

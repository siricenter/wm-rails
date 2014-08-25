require 'rails_helper'

RSpec.describe "maintenances/show", :type => :view do
  before(:each) do
    @maintenance = assign(:maintenance, Maintenance.create!(
      :tenant_name => "Tenant Name",
      :building_id => 1,
      :location => "Location",
      :description => "Description",
      :tenant_phone => "Tenant Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tenant Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Tenant Phone/)
  end
end

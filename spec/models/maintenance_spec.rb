require 'rails_helper'

RSpec.describe Maintenance, :type => :model do
  subject {FactoryGirl.build :maintenance}
  
  it "has a valid factory" do
    expect(subject).to be_valid
  end
  
  before(:each) do
    subject = FactoryGirl.build :maintenance
  end
  
  it "is invalid without tenant_name" do
    subject.tenant_name = nil
    expect(subject).to_not be_valid
	end

  it "is invalid without tenant_phone" do
    subject.tenant_phone = nil
    expect(subject).to_not be_valid
	end
  
  it "is invalid without building_id" do
    subject.building_id = nil
    expect(subject).to_not be_valid
	end

  it "is invalid without location" do
    subject.location = nil
    expect(subject).to_not be_valid
	end

  it "is invalid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
	end
  
end

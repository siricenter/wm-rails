require 'rails_helper'

RSpec.describe Apartment, :type => :model do
  subject {FactoryGirl.build :apartment}
  
  it "has a valid factory" do
    expect(subject).to be_valid
  end
  
  before(:each) do
    subject = FactoryGirl.build :apartment
  end
  
  it "is invalid without image_id" do
    subject.image_id = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  
end

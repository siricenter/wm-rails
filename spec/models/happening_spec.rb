require 'rails_helper'

RSpec.describe Happening, :type => :model do
  subject {FactoryGirl.build :happening}
  
  it "has a valid factory" do
    expect(subject).to be_valid
  end
  
  before(:each) do
    subject = FactoryGirl.build :happening
  end
  
  it "is invalid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without heading" do
    subject.heading = nil
    expect(subject).to_not be_valid
  end
  
end

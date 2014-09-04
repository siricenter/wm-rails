require 'rails_helper'

RSpec.describe StudyRoom, :type => :model do
  subject {FactoryGirl.build :study_reservation}
  
  it "has a valid factory" do
    expect(subject).to be_valid
  end
  
  before(:each) do
    subject = FactoryGirl.build :study_reservation
  end
  
  it "is invalid without room_type" do
    subject.rm_type = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without rm_number" do
    subject.rm_number = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without floor" do
    subject.floor = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without building" do
    subject.building_id = nil
    expect(subject).to_not be_valid
  end
  
end

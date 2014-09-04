require 'rails_helper'

RSpec.describe StudyReservation, :type => :model do
  subject {FactoryGirl.build :study_reservation}
  
  it "has a valid factory" do
    expect(subject).to be_valid
  end
  
  
  before(:each) do
    subject = FactoryGirl.build :study_reservation
  end
  
  it "is invalid with study_room" do
    subject.study_room = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without start" do
    subject.start = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without stop" do
    subject.stop = nil
    expect(subject).to_not be_valid
  end
  
  it "is invalid without date" do
    subject.date = nil
    expect(subject).to_not be_valid
  end
  
end

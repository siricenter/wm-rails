require 'rails_helper'

RSpec.describe MarketingText, :type => :model do
	subject {FactoryGirl.build :marketing_text}
	it "has a valid factory" do
		expect(subject).to be_valid
	end

	it "is invalid without text" do
		subject.text = nil
		expect(subject).to_not be_valid
	end
end

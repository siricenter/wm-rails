# == Schema Information
#
# Table name: marketing_texts
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

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

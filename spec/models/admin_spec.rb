# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'rails_helper'

RSpec.describe Admin, :type => :model do
	subject {FactoryGirl.build :admin}

	it "has a valid factory" do
		expect(subject).to be_valid
	end

	it "is invalid without an email" do
		subject.email = nil
		expect(subject).to_not be_valid
	end

	it "is invalid without a password" do
		subject.password = nil
		expect(subject).to_not be_valid
	end

	it "successfully creates an admin" do
		expect {FactoryGirl.create :admin}.to change(Admin, :count).by(1)
	end
end

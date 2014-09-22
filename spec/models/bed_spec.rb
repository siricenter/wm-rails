# == Schema Information
#
# Table name: beds
#
#  id           :integer          not null, primary key
#  letter       :string(255)
#  apartment_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Bed, :type => :model do
	subject {FactoryGirl.build(:bed)}
	describe 'Factory' do
		it 'has a valid factory' do
			expect(subject).to be_valid
		end
	end
end

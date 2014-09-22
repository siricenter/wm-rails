require 'rails_helper'

RSpec.describe 'ajax/beds.json.rabl', type: :view do
	let(:apartments) {
		building = FactoryGirl.create(:building)
		apartment1 = FactoryGirl.create(:apartment, building: building)
		apartment2 = FactoryGirl.create(:apartment, building: building)

		FactoryGirl.create(:bed, apartment: apartment1)
		FactoryGirl.create(:bed, apartment: apartment1)
		FactoryGirl.create(:bed, apartment: apartment2)
		[apartment1, apartment2]
	}

	subject {apartments}

	before :each do
		@apartments = subject
		@rendered = render
		@parsed = JSON.parse(@rendered)
	end

	it 'renders without errors' do
	end

	it 'includes the apartments number'
	it 'includes all the apartments beds'
	it 'specifies whether the bed is available that semester'
end

require 'rails_helper'

RSpec.describe 'ajax/beds.json.rabl', type: :view do
	before :each do
		building = FactoryGirl.create(:building)
		apartment1 = FactoryGirl.create(:apartment, building: building)
		apartment2 = FactoryGirl.create(:apartment, building: building)

		bed1 = FactoryGirl.create(:bed, apartment: apartment1)
		bed2 = FactoryGirl.create(:bed, apartment: apartment1)
		bed3 = FactoryGirl.create(:bed, apartment: apartment2)
		@apartments = [apartment1, apartment2]
	end

	it 'renders without errors'
	it 'includes all the apartments beds'
	it 'specifies whether the bed is available that semester'
end

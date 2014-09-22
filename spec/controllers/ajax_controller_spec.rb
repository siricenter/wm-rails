require 'rails_helper'

RSpec.describe AjaxController, :type => :controller do
	describe 'beds' do
		it 'Should return a list of apartments for a building' do
			apartment1 = FactoryGirl.create(:apartment)
			apartment2 = FactoryGirl.create(:apartment, building: apartment1.building)
			FactoryGirl.create(:apartment)
			semester = FactoryGirl.create(:semester)

			get :beds, {building_id: apartment1.building.to_param, semester_id: semester.to_param}
			expect(assigns(:apartments)).to match_array([apartment1, apartment2])
		end
	end
end

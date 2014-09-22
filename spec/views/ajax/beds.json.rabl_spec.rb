require 'rails_helper'

RSpec.describe 'ajax/beds.json.rabl', type: :view do

	let(:semester) {
		assign(:semester, @semester1 = FactoryGirl.create(:semester))
	}

	let(:apartments) {
		building = FactoryGirl.create(:building)
		@apartment1 = FactoryGirl.create(:apartment, building: building)
		@apartment2 = FactoryGirl.create(:apartment, building: building)

		@bed1 = FactoryGirl.create(:bed, apartment: @apartment1)
		@bed2 = FactoryGirl.create(:bed, apartment: @apartment1)
		@bed3 = FactoryGirl.create(:bed, apartment: @apartment2)

		@contract = FactoryGirl.create(:contract, bed: @bed2, semesters: [semester])
		assign(:apartments, [@apartment1, @apartment2])
	}


	let(:apartments_json) {
		{
			"apartments" => [
				{
					"id" => @apartment1.id,
					"title" => @apartment1.title, 
					"beds" => [
						{
							"id" => @bed2.id, 
							"letter" => @bed2.letter,
							"available" => false,
						},
						{
							"id" => @bed1.id, 
							"letter" => @bed1.letter,
							"available" => true,
						},
					]
				},
				{
					"id" => @apartment2.id,
					"title" => @apartment2.title,
					"beds" => [
						{
							"id" => @bed3.id, 
							"letter" => @bed3.letter,
							"available" => true,
						},
					]
				},
			]
		}
	}

	subject {apartments}

	before :each do
		@apartments = subject
		@rendered = render
		@parsed = JSON.parse(@rendered)
	end

	it 'renders without errors' do
	end

	it 'includes all the apartments' do
		expect(@parsed['apartments'].size).to eq(2)
	end

	it 'includes the apartments number' do
		expect(@parsed['apartments'].first['title']).to eq(@apartments.first.title)
		expect(@parsed['apartments'].last['title']).to eq(@apartments.last.title)
	end

	it 'matches the expected json' do
		expect(@parsed).to eq(apartments_json)
	end
end

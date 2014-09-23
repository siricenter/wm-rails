Given(/^that there is an available bed$/) do
	@apartment = FactoryGirl.create(:apartment, title: '207')
	@bed = FactoryGirl.create(:bed, letter: 'c', apartment: @apartment)
end

Given(/^I have selected a semester$/) do
	@semester = FactoryGirl.create(:semester)
end

When(/^I visit the choose page$/) do
	visit choose_apartment_path(@semester)
end

When(/^I select an available bed$/) do
	 find('.choose-right').click
	 find('.floor2').click
	 page.first(:xpath, '//div[@data-aptnum="207"]').click
	 page.first(:xpath, '//div[@data-bedlabel="c"]').click
end

When(/^I confirm my information$/) do
	click_on 'Proceed to Contract'
end

Then(/^I should be on the new contract page$/) do
	expect(current_path).to eq(new_contract_path(@apartment.building, @semester))
end

Then(/^my information should be integrated into the form$/) do
	pending # express the regexp above with the code you wish you had
end

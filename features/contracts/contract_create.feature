Feature: Student signs new contract
	As a student
	I want to sign a contract
	So that I can live in Windsor Manor

	@javascript
	Scenario: Student signs contract
		Given that there is an available bed
		And I have selected a semester
		When I visit the choose page
		And I select an available bed
		And I confirm my information
		Then I should be on the new contract page
		And my information should be integrated into the form


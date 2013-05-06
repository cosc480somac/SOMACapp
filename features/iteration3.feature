Feature: Iteration 3

	Scenario: View Daily Calendar
		Given I am authenticated
		And I am on the calendar page
		And I press List Shifts for the Week
		Then I should see the daily list view page

	Scenario: Add Positions to Profile
		Given I am authenticated
		And I am on Edit Profile Page
		When I check the following positions: Driver, Medic
		And I press Submit
		Then I should see Driver
		And I should see Medic

	Scenario: Add Certificates to Profile
		Given I am authenticated
		And I am on my profile page
		When I follow Add New Certificate
		And I fill in Certificate with EMT Training
		And I press Save Changes
		Then I should be on my profile page
		And I should see EMT Training

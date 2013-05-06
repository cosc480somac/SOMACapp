Feature: Iteration 3

	Scenario: See Shifts Up for Trade
		Given I am authenticated
		And I am on the calendar page
		And There is a shift up for trade
		Then I should see that shift highlighted

	Scenario: View Trades
		Given I am authenticated
		And I am on the calendar page
		And I follow Trades
		Then I am on the Trades page

	Scenario: Request a Trade
		Given I am authenticated
		And I am on the Trades Page
		And I press Request a Trade
		And I select the 9-12 EMT shift for 4/20/13
		And I press Submit
		Then I am on the Trades Page
		And I should see that shift

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
		And I am on Edit Profile Page
		When I fill in Certificate with EMT Training
		And I press Submit
		Then I should visit my profile page
		Then I should see EMT Training

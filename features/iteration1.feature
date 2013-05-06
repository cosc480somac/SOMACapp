Feature: iteration 1

	Scenario: Looking at calendar
		Given I am authenticated
		And I am on the calendar page
		Then I should see the current month


	Scenario: Creating a shift
		Given I am authenticated
		And I am on the calendar page
		When I follow Create New Event
		And I fill in PARTY TIME for Name
		When I press Create Event
		Then the event should be created

Feature: Iteration 2
	Scenario: Creating an account
		Given I am not authenticated
		Then I should be on the login page
		When I go to register
		And I fill in "username" with "<username>"
		And I fill in “e-mail” with ”<email>”
		And I fill in "user_password" with "<password>"
		And I fill in "user_password_confirmation" with "<password>"
		And I follow "Sign up"
		Then I should see "logged in as <username>" # your work
		And I should be on the calendar page

	Scenario: Logging in with invalid information
		Given I am not authenticated
		Then I should be on the login page
		When I fill in “username” with “<username>”
		And I fill in “password” with “<password>”
		When I follow “Sign in”
		Then I should see the message “invalid login information”
		And I should be on the login page

	Scenario: Logging in with valid information
		Given I am not authenticated
		Then I should be on the login page
		When I fill in “username” with “<username>”
		And I fill in “password” with “<password>”
		When I follow “Sign in”
		Then I should be on the calendar page

	Scenario: Checking User Profile
		Given I am on my profile page
		Then I should see my information

	Scenario: Editing User Profile
		Given I am on my profile page
		And I follow “Edit”
		When I fill in “Email” to “testuseredit@colgate.edu”
		And I press “Submit”
		Then I am on my profile page
		And I should see “testuseredit@colgate.edu”

	Scenario: View Weekly Calendar
		Given I am on the Calendar page
		And I follow “Weekly”
		Then I should see the weekly calendar

	Scenario: View Daily Calendar
		Given I am on the Calendar page
		And I click on a day
		Then I should see the daily view


	


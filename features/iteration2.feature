Feature: Iteration 2
	Scenario: Creating an account

		Given I am on the login page
		When I go to register
		And I fill in email with testuser@gmail.com
		And I fill in password with test111
		And I fill in password_confirmation with test111
		And I follow Sign up
		Then I should see "You have signed up successfully"
		And I am on calendar page

	Scenario: Logging in with invalid information

		Given I am on the login page
		When I fill in email with testuser@gmail.com
		And I fill in password with test111
		When I follow Sign in
		Then I should be on the login page

	Scenario: Logging in with valid information
		Given I am on the login page
		And I am a user
		When I fill in email with testuser@gmail.com
		And I fill in password with test111
		When I follow Sign in
		Then I should be on calendar page

	Scenario: Checking User Profile
		Given I am authenticated
		And I am on my profile page
		Then I should see "testuser@gmail.com"
		Then I should see "555-555-5555"
		Then I should see "EMT"

	Scenario: Editing User Profile
		Given I am authenticated
		And I am on my profile page
		And I follow Edit User
		When I fill in phone with 123-456-7891
		And I press Submit
		Then I am on my profile page





	


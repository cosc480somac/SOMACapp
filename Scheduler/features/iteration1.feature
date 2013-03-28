Scenario outline: Creating an account
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

Scenario outline: Logging in with invalid information
	Given I am not authenticated
	Then I should be on the login page
	When I fill in “username” with “<username>”
	And I fill in “password” with “<password>”
	When I follow “Sign in”
	Then I should see the message “invalid login information”
	And I should be on the login page

Scenario outline: Logging in with valid information
	Given I am not authenticated
	Then I should be on the login page
	When I fill in “username” with “<username>”
	And I fill in “password” with “<password>”
	When I follow “Sign in”
	Then I should be on the calendar page
	
Scenario outline: Going to User Profile
	Given that I am authenticated
	When I follow "Profile"
	Then I am on my profile page
	And I should see my information

Scenario outline: Editing User Profiles
	Given that I am on my profile page
	When I follow “Edit Profile”
	And I fill in "Email" with "testuser@gmail.com"
	And I press "Save Changes"
	Then I am on my profile page
	And I should I should see "testuser@gmail.com"

Scenario Outline: Looking at calendar
	Given that I am on the calendar page
	And I am using the default view
	Then I should see the current week
	And I should see existing shifts in red
	And I should see available shifts in green

Scenario Outline: Selecting a day
	Given that I am on the calendar page
	And I am using the weekly view
	When I follow "Today"
	Then I should see the current day
	And I should see existing shifts in red
	And I should see available shifts in green

Scenario Outline: Selecting a shift
	Given that I am on the calendar page
	And I have an EMT shift from 1:00 PM to 2:00 PM on the current day
	And I am using the weekly view
	When I follow the shift in the 1:00 PM to 2:00 PM slot
	Then I should be on the shift page for this time slot
	And I should see “<username>” under “username”
	And I should see “<EMT>” under “position”

Scenario Outline: Filling a shift
	Given that I am on the calendar page
	And there is an available EMT shift from 1:00 PM to 2:00 PM on the current day
	And I am using the weekly view
	When I follow the shift in the 1:00 PM to 2:00 PM slot
	Then I should be on the shift page for this time slot
	And I follow “Fill This Shift”
	Then I should be on the shift page for this time slot
	And I should see “<username>” under “username”
	And I should see “<EMT>” under “position”


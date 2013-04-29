
Then /^I should see the current week$/ do
page.should have_content('24-Hours')
end

When(/^I visit 'Weekly Calendar'$/) do
  visit('/weekly')
end

And /^I fill in email with testuser@gmail.com$/ do
	fill_in(:user_email, :with => "testuser@gmail.com")
end

And /^I fill in email with testuseredit@colgate.edu$/ do
	fill_in(:user_email, :with => "testuseredit@colgate.edu")
end

And /^I fill in password with test111$/ do
	fill_in(:user_password, :with => "test111")
end

And /^I fill in password_confirmation with test111$/ do
	fill_in(:user_password_confirmation, :with => "test111")
end

And /^I follow Sign up$/ do
	click_button( 'Sign up')
end

And /^I follow Sign in$/ do
	click_button( 'Sign in')
end


And /^I am a user$/ do
	@current_user = User.create!(:email => "testuser@gmail.com",
															:first_name => "test",
															:last_name => "user",
															:phone => "555-555-5555",
															:password => "test111",
															:password_confirmation => "test111")
end

Given /^I am authenticated$/ do
	visit ("/users/sign_up")
	fill_in("user_email", :with => "testuser@gmail.com")
	fill_in(:user_password, :with => "test111")
	fill_in(:user_password_confirmation, :with => "test111")
	click_button( "Sign up")
	@current_user = User.find_by_email("testuser@gmail.com")
	@current_user.first_name ="test"
	@current_user.last_name = "user"
	@current_user.phone = "555-555-5555"
	@current_user.save
	@position = Position.create(:title => "EMT", :user_id => @current_user.id)
end


Then /^I should see the current month$/ do
page.should have_content('March')
end

Then /^the event should be created$/ do
page.should have_content('Event was successfully created')
end

And /^I fill in PARTY TIME for Name$/ do 
  fill_in('Name', :with => 'PARTY TIME')
end 

When /^I follow New Event$/ do
  click_link('New Event')
end

When /^I press Create Event$/ do
  click_button('Create Event')
end

Then /^I should be on my profile page$/ do
	assert page.has_content?("Test User")
	current_path.should == ("/users/#{@current_user.id}")
end

When /^I follow Edit$/ do
	click_link ('Edit')
end

When /^I press Submit$/ do
	click_button ('Submit')
end
And /^I press List Shifts for the Week$/ do
	click_button ('List Shifts for the Week')
end

Then /^I should see the daily list view page$/ do
	assert page.has_content?("Monday")
	assert page.has_content?("Tuesday")
	assert page.has_content?("Wednesday")
	assert page.has_content?("Thursday")
	assert page.has_content?("Friday")
	assert page.has_content?("Saturday")
	assert page.has_content?("Sunday")
end



Then /^I should see "testuseredit@colgate.edu"$/ do
  assert page.has_content?("testuseredit@colgate.edu")
end

Given /^There is a shift up for trade$/ do
	# assert page.has_content or assert that the trade table has something?
end

Then /^I should see that shift highlighted$/ do
	# not sure if we can do this
end

Given /^I follow Trades$/ do
	click_link ('Trade')
end

Given /^I press Request a Trade$/ do
	click_button ('Request a Trade')
end

Given /^I select the 9-12 EMT shift for 4\/20\/13$/ do
	#implement with checkboxes?
end

Then /^I should see that shift$/ do
	assert page.has_content('EMT')
	assert page.has_content('9-12')
	assert page.has_content('4/20/13')
end

Given /^I press 4\/20\/13$/ do
	click_button ('4/20/13')
end

Then /I should see the daily view for 4\/20\/13$/ do
	assert page.has_content('4/20/13')
end

Given /^I press Add Position$/ do
	click_button('Add Position')
end

When /^I select Stand By$/ do
	# Not sure how to test the select thing
end

Then /^I should see Stand By$/ do
	assert page.has_content('Stand By')
end

Given /^I press Add Certificate$/ do
	click_button ('Add Certificate')
end

When /^I fill in Certificate with EMT Training$/ do
fill_in(:certificate, :with => "EMT Training")
end

When /^I fill in Expiration Date with 1\/1\/2015$/ do
	fill_in(:expiration_date, :with => "1/1/2015")
end

Then /^I should see EMT Training$/ do
	assert page.has_content('EMT Training')
end

And /^I should see 1\/1\/2015$/ do
	assert page.has_content ('1/1/2015')
end

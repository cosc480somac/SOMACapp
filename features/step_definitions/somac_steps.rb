
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

Then /^I should see "testuseredit@colgate.edu"$/ do
  assert page.has_content?("testuseredit@colgate.edu")
end



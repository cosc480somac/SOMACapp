
And /^I fill in email with testuser@gmail.com$/ do
	fill_in(:user_email, :with => "testuser@gmail.com")
end

And /^I fill in phone with 123-456-7891$/ do
	fill_in(:user_phone, :with => "123-456-7891")
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
	page.select("Helper", :from => "user_role")
	click_button( "Sign up")
	@current_user = User.find_by_email("testuser@gmail.com")
	@current_user.first_name ="test"
	@current_user.last_name = "user"
	@current_user.phone = "555-555-5555"
	@current_user.save
	@position = Position.create(:title => "EMT", :user_id => @current_user.id)
	@position = Position.create(:title => "Medic", :user_id => @current_user.id)
	@position = Position.create(:title => "Driver", :user_id => @current_user.id)
	@certificate = Certificate.create(:name => "EMT License", :user_id =>1, :expiration_date => "12/12/12")
end


Then /^I should see the current month$/ do
page.should have_content('May')
end

Then /^the event should be created$/ do
page.should have_content('Event was successfully created')
end

And /^I fill in PARTY TIME for Name$/ do 
  fill_in('Name', :with => 'PARTY TIME')
end 

When /^I follow Create New Event$/ do
  click_button('Create New Event')
end

When /^I press Create Event$/ do
  click_button('Create Event')
end

When /^I follow Edit User$/ do
	click_link ('Edit User')
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

When /^I fill in Certificate with EMT Training$/ do
	fill_in('certificate_name', :with => 'EMT Training')
end

Then /^I should see EMT Training$/ do
	assert page.should have_content('EMT Training')
end
Then /^I should see Driver$/ do
	assert page.should have_content('Driver')
end

Then /^I should see Medic$/ do
	assert page.should have_content('Medic')
end

Then /^I should not see EMT$/ do
	assert page.should_not have_content('EMT')
end

When /I (un)?check the following positions: (.*)/ do |uncheck, positions_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
	positions_list.split(', ').each do |r|
		position = "positions_" + r
		if uncheck
			uncheck(position)
		else
			check(position)
		end
	end
end

When /^I follow Add New Certificate$/ do
	click_link('Add New Certificate')
end

And /^I press Save Changes$/ do
	click_button('Save Changes')
end


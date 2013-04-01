Given /^I am on the calendar page$/ do
 visit ('/calendar')
 current_path.should == ( '/calendar')
end

Given /^I am on the events page$/ do
 visit ('/events')
 current_path.should == ( '/events')
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


Given /^I am authenticated$/ do
	fill_in "user_session[username]", :with => "testuser"
	fill_in "user_session[password]", :with => "password"
	@current_user   = User.create(:first_name => "test",
																:last_name => "user",
																:email => "testuser@gmail.com"
																:phone => "555-555-5555")
	@date = Date.parse(27-03-2013)
end

Then /^I am on my profile page$/ do
	assert page.has_content?('#{@current_user.first_name}')
	assert page.has_content?('#{@current_user.last_name}')
	current_path.should == "/#{@current_user.id}"
end

And /^I am using the (weekly | default) view$/ do |view_type|
	if view_type == "weekly"
		#checks if display shows just a week with the current day being Wednesday March 27th 2013.  (I'm not sure if this is how the calendar structure is set up so this might not work)
		page.body =~ /3/24/13.*3/25/13.*3/26/13.*3/27/13.*3/28/13.*3/29/13.*3/30/13/m
	elsif view_type == "default"
		# what is default?
	end
end

Then /^I should see the current (week | day)$/ do |view_date|
	if view_date == "week"
		page.body =~ /3/24/13.*3/25/13.*3/26/13.*3/27/13.*3/28/13.*3/29/13.*3/30/13/m
	elsif view_date == "day"
		# makes sure just today is being shown.
		assert page.has_content?('3/27/13')
		page.should have_no_content('3/26/13')
		page.should have_no_content('3/28/13')
	end
end

Then /^I should see the (existing | available) shifts in (red | green)$/ do |shift, color|
	
end

And /^I have an EMT shift from 1:00 PM to 2:00 PM on the current day$/ do

end


When /^I follow the shift in the 1:00 PM to 2:00 PM slot$/ do

end

Then /^I should be on the shift page for this time slot$/ do
	
end

And /^I should see "<username>" under "username"$/ do

end

And /^I should see "Test User" under "Name"$/
	page.body =~ /Name: Test User/m
end

And /^I should see "EMT" under "position"$/
	page.body =~ /Position: EMT/m
end

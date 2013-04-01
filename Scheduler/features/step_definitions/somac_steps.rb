Given /^I am on the calendar page$/ do
 visit ('/calendar')
 current_path.should == (root_url+'/calendar')
end

Then /^I should see the current month$/ do
flunk "unimplimented"
end

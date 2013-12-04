Then(/^I should see the user "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "No users found with that last name"$/) do |arg1|
  page.body.should match(/No users found with that last name/)
end

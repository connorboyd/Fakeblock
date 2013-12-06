Given /^(?:I )am on the "(.+)" page$/ do |page_name|
	#visit path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:I )press "(.*?)"$/ do |button|
	#
end

When /^(?:I )enter in the following fields: (.*)$/ do |fields_list|
	fields = fields_list.split(',')
end
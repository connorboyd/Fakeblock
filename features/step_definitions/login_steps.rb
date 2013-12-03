require 'uri'
require 'cgi'

Given /^(?:I )am on (?:.*\s)"(.*?)" page$/ do |page_name|
	#visit path_to(page_name)
end

When /^(?:I )enter in the following fields: (.*)$/ do |fields_list|
	fields = fields_list.split(',')
end

When /^(?:I )press "(.*?)"$/ do |button|
	#
end

Then /^(?:I )should be on (?:.*) "(.*?)" page$/ do |page|
	#
end

When /^(?:I )select "(.*?)"$/ do |link|
	#
end
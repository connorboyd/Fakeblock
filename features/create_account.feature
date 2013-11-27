#encoding: utf-8

Feature: Create account
	User fills out first name, last name, email, password, confirm password, hit create button and is taken to newsfeed page
	User will get error if passwords do not match
	User will get error if try to create duplicate account

Scenario: New user filling out form
	Given I am on the "create new user" page
	When I enter in the following fields: first_name, last_name, email, password, confirm_password
	And I press "create account"
	Then I should be on my "newsfeed" page

Scenario: Passwords do not match
	Given I am on the "create new user" page
	When I enter in the following fields: password, confirm_password
	And the fields do not match
	Then I should see an error
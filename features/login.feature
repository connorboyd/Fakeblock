#encoding: utf-8
Feature: Login
	User is taken to their newsfeed after correct login
	User is new and selects 'create an account' and is taken to create account page

Scenario: Existing user logs in
	Given I am on the "login" page
	When I enter in the following fields: username, password
	And I press "login"
	Then I should be on my "newsfeed" page

Scenario: New user
	Given I am on the "login" page
	When I select "create account"
	Then I should be on the "newuser" page

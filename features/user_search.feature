#encoding: utf-8

Feature: User Search
	A user can go to the search page and search for users by last name
	If a user goes enters a last name into the search box, it should display all users with that last name

Scenario: User searches for other users
	Given I am on the "search" page
	And I fill in "search_field" with "Boyd"
	And I press "Search"
	Then I should see the user "Connor Boyd" 

Scenario: User searches for a nonexistant user
	Given I am on the "search" page
	And I fill in "search_field" with "somenonexistantlastname"
	And I press "Search"
	Then I should see "No users found with that last name"
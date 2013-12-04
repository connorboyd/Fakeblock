#encoding: utf-8

Feature: Friend Requests
	A user can send friend requests to other users
	The friend request should show up in the other user's Profile Preferences page
	If the other user accepts the friend request, the users should then be friends
	If the other user denies the friend request, the users should not be friends

Scenario: User accepts a friend request
	Given I am on my "profile preferences" page
	And I have a friend request from "Test Account"
	And I click "accept"
	Then "Test Account" should be my friend
	And the friend request from "Test Account" should appear in my pending friend requests

Scenario: User denies a friend request
	Given I am on my "profile preferences" page
	And I have a friend request from "Test Account"
	And I click "deny"
	Then "Test Account" should not be my friend
	And the friend request from "Test Account" should appear in my pending friend requests
Feature: Merge Articles
	As an administrator
	In order include the contributions of multiple users
	I want to be able to merge two users' articles

Background:
	Given the blog is set up

Scenario: A non-admin cannot merge articles
	Given I am not logged into the admin panel
	And I am on the edit page for article 3
	Then I should not see "Merge Articles"
	And I should not see /merge_with/

Scenario: When articles are merged, the merged article should contain the text of both previous articles
	Given I am logged into the admin panel
	And I am on the edit page for article 3
	When I fill in "Article ID" with "5"
	And I press "Merge"
	Then I should see the body of article 3
	And I should see the body of article 5

Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article)
	Given I am logged into the admin panel
	And I am on the edit page for article 3
	When I fill in "Article ID" with "5"
	And I press "Merge"
	When I go to the page for article 3
	Then I should see the author of article 3

Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article
	Given I am logged into the admin panel
	And I am on the edit page for article 3
	When I fill in "Article ID" with "5"
	And I press "Merge"
	When I go to the page for article 3
	Then I should see the comments of article 3
	And I should see the comments of article 5

Scenario: The title of the new article should be the title from either one of the merged articles
	Given I am logged into the admin panel
	And I am on the edit page for article 3
	When I fill in "Article ID" with "5"
	And I press "Merge"
	When I go to the page for article 3
	Then I should see the title of article 3	
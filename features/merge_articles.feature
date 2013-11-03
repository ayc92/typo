Feature: Merge Articles
	As an administrator
	In order include the contributions of multiple users
	I want to be able to merge two users' articles

Background:
	Given the blog is set up

Scenario: A non-admin cannot merge articles
	Given I am not logged into the admin panel
	Then I should not see "Merge Articles"
	And I should not see //input[@name="merge_with"]

Scenario: When articles are merged, the merged article should contain the text of both previous articles
	Given I am logged into the admin panel
	And I am on the edit page for article 3
	Then when I fill in "Article ID" with "5"
	And I press "Merge"
	Then I should see the content of article 3
	and I should see the content of article 5

Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article)
	Given I am logged into the admin panel
	And I am on the edit page for article 3
	Then when I fill in "Article ID" with "5"
	And I press "Merge"
	Then I should be on the edit page for article 3
	and I should see the author of article 3

Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article

Scenario: The title of the new article should be the title from either one of the merged articles
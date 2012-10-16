Feature: Merge Articles
  As a blog administrator
  In order to combine content from two articles
  I want to be able to merge two articles

Background: the articles exist
  Given the blog is set up
  Given the following articles exist:
  | title    	      | author		| body                          |
  | Bees	      | Nicolas Cage	| More dangerous than we think? |
  | Stratosphere Jump | John Drake	| That was pretty cool.         |
  
  And I am logged into the admin panel    

Scenario: Successfully merge two articles
	  When I follow "All Articles"
	  And I follow "Edit"
    	  And I fill in "merge_with" with "2"
    	  And I press "Merge"
    	  Then I should be on the page of the new article
    	  And its title should be "Bees"
    	  And its author should be the author of "Bees"
    	  And it should have the comments from both "Bees" and "Stratosphere Jump"
    	  And its text should contain the text of both "Bees" and "Stratosphere Jump"
    	  And the original articles should still exist

Scenario: Try to merge when not admin
	  Given I am not an administrator
    	  Then I should not see the "Merge" button
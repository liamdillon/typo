Feature: Merge Articles
  As a blog administrator
  In order to combine content from two articles
  I want to be able to merge two articles

Background: the articles exist
  Given the blog is set up
  Given the following articles exist:
  | title    	      | author		| body                          | comments   |
  | Bees	      | Nicolas Cage	| More dangerous than we think? | [apple]    |
  | Stratosphere Jump | John Drake	| That was pretty cool.         | [banana]   |
  
  And I am logged into the admin panel    

Scenario: Successfully merge two articles
	  When I follow "All Articles"
	  And I follow "Edit"
    	  And I fill in "merge_with" with "2"
    	  And I press "Merge"
    	  Then I should be on "/admin/content"
    	  And I should see "Bees"
    	  And I should not see "Stratosphere Jump"
    	  And I should see "apple"
    	  And I should see "banana"

Scenario: Try to merge when not admin
	  Given I am not an administrator
    	  Then I should not see the "Merge" button
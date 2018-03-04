Feature: Homepage

Scenario: Guest sees the welcome message
  When I go to the homepage
  Then I should see the welcome messages

Scenario: User sees the welcome message
  Given I am logged in  
  When I go to the homepage
  Then I should not see the welcome messages
  And I should see the Message Center

Feature: Organizations

Scenario: User views their organization page
  Given I am logged in
  And I am part of an organization
  And the organization has 3 groups
  When I view the organization page
  Then I should see the organization's name
  And I should see "Groups (3)"
  And I should see 3 groups

@javascript
Scenario: Adding a new group
  Given I am logged in
  And I am part of an organization
  And I am on the organization page
  When I click "New Group"
  And I wait for ajax
  And I fill out the new group form
  And I press submit
  And I wait for ajax
  And I click "New Group"
  And I wait for ajax
  And I fill out the new group form
  And I press submit
  And I wait for ajax
  Then I should see "Groups (2)"
  And I should see the name of the last 2 groups I added

@javascript
Scenario: Not filling out the name of the new group
  Given I am logged in
  And I am part of an organization
  And I am on the organization page
  When I click "New Group"
  And I wait for ajax
  And I press submit
  Then I should see "Name can't be blank"

@javascript
Scenario: Adding a group that exists
  Given I am logged in
  And I am part of an organization
  And the organization has 1 groups
  And I am on the organization page
  When I click "New Group"
  And I wait for ajax
  And I fill out the new group form with duplicate data
  And I press submit
  Then I should see "Groups (1)"
  And I should see "Name name must be unique to the orginization"

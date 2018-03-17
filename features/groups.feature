Feature: Groups

Scenario: User views a group page
  Given I am logged in
  And I am part of an organization
  And the organization has 3 groups
  When I view the group page
  Then I should see the group's name
  And I should see "Projects"

@javascript
Scenario: Adding a new group
  Given I am logged in
  And I am part of an organization
  And I am on the organization page
  And the organization has 3 groups
  When I view the group page
  And I click "New Project"
  And I wait for ajax
  And I fill out the new project form
  And I press submit
  And I wait for ajax
  And I click "New Project"
  And I wait for ajax
  And I fill out the new project form
  And I press submit
  And I wait for ajax
  Then I should see "Projects"
  And I should see the name of the last 2 projects I added

@javascript
Scenario: Not filling out the name of the new project
  Given I am logged in
  And I am part of an organization
  And I am on the organization page
  And the organization has 1 groups
  When I view the group page
  When I click "New Project"
  And I wait for ajax
  And I press submit
  Then I should see "Title can't be blank"

@javascript
Scenario: Adding a group that exists
  Given I am logged in
  And I am part of an organization
  And the organization has 1 groups
  And I am on the organization page
  And the organization has 1 groups
  And the group has 1 projects
  When I view the group page
  And I click "New Project"
  And I wait for ajax
  And I fill out the new project form with duplicate data
  And I press submit
  Then I should see "Projects"
  And I should see "Project Title must be unique to the group"

Feature: Viewing projects when there are none
  In order to view projects
  As a user
  I want to be informed if there are no projects in the system

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as them

  Scenario: Viewing projects when there are none
    And I am on the homepage
    Then I should see "There are no projects. Click here to create one."

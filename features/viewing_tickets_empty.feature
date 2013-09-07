Feature: Viewing tickets when there are none
  In order to view tickets
  As a user
  I want to be informed if there are no tickets for a project

  Background:
    Given there are the following users:
      | email                     | password |
      | user@ticketee.com         | password |
      | unauthorised@ticketee.com | password |
    And there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" can create tickets on the "TextMate 2" project
    And "unauthorised@ticketee.com" can view the "TextMate 2" project

  Scenario: Viewing a project with no tickets (as someone who can create tickets)
    When I am signed in as "user@ticketee.com"
    And I am on the homepage
    And I follow "TextMate 2"
    Then I should see "There are no tickets. Click here to create one."

  Scenario: Viewing a project with no tickets (as someone who canNOT create tickets)
    When I am signed in as "unauthorised@ticketee.com"
    And I am on the homepage
    And I follow "TextMate 2"
    Then I should see "There are no tickets."

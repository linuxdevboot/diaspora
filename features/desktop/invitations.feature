@javascript
Feature: Invitations
  Background:
    Given following users exist:
      | username    | email             |
      | Alice Smith | alice@alice.alice |

  Scenario: accept invitation from admin
    Given I have been invited by an admin
    And I am on my acceptance form page
    And I fill in the new user form
    And I press "Sign up"
    Then I should be on the getting started page
    And I should see "Well, hello there!"
    And I fill in the following:
      | profile_first_name         | O             |

    And I follow "awesome_button"
    And I confirm the alert
    Then I should be on the stream page
    And I close the publisher

  Scenario: accept invitation from user
    Given I have been invited by "alice@alice.alice"
    And I am on my acceptance form page
    And I fill in the new user form
    And I press "Sign up"
    Then I should be on the getting started page
    And I should see "Well, hello there!"
    And I should be able to friend "alice@alice.alice"
    And I fill in the following:
      | profile_first_name         | O             |

    And I follow "awesome_button"
    And I confirm the alert
    Then I should be on the stream page
    And I close the publisher
    And I log out
    And I sign in as "alice@alice.alice"
    And I click on "Invite your friends" navbar title
    And I click on selector "#invitations-button"
    Then I should see one less invite

  Scenario: sends an invitation
    When I sign in as "alice@alice.alice"
    And I click on "Invite your friends" navbar title
    And I click on selector "#invitations-button"
    And I fill in the following:
      | email_inviter_emails         | alex@example.com    |
    And I press "Send an invitation"
    Then I should have 1 Devise email delivery
    And I should not see "change your notification settings" in the last sent email

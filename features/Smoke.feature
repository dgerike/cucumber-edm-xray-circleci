@REQ_XRAYT-17
Feature: Smoke test

  Scenario: Google search
    When I go to the Google start page
    And I search for something
    Then I should see search results

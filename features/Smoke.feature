Feature: Smoke test
  @TEST_XRAYT-709
  Scenario: Google search
    When I go to the Google start page
    And I search for something
    Then I should see search results

Feature: Active Admin Login functionality
  Scenario: visiting active admin page
    Given a user goes to active admin page
    When a user enters their email "admin@example.com"
    When a user enters their password "password"
    When a user clicks on login
    Then user should log in

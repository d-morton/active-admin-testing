Feature: Active Admin Articles Index functionality
  Scenario: visiting active admin articles index page
    Given a user logs in to active admin
    When a user visits the "articles" index
    Then user should see the articles title
    Then user should see the articles table

Feature: Adding ATOM / RSS feeds to posts

    As a visitor to the site
    I need rss and atom feed links available
    to view the feed later on my reader

  Background:
    Given 7 Posts
    And I am on the posts index


  Scenario: Index page has link to feed
    Then I should see the "rss" link
    And I should see the "atom" link

  Scenario: RSS feed link takes me to a RSS feed
    When I click the "rss" link
    Then I should see the rss content

  Scenario: ATOM feed link takes me to the ATOM feed
    When I click the "atom" link
    Then I should see the atom content

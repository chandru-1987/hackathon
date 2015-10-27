Feature: Rides page

  Background:
    Given app has basic setup
    Given I am authenticated user

  @javascript
  Scenario: Rides on the index page
    When I click the "Rides" link on home page
    Then I am on "/rides" page
    Then I should see the no rides in the "#rides_table" table
    When I create some new rides
    When I click the "Rides" link on home page
    Then I should see the rides in the "#rides_table" table

  @javascript
  Scenario: Creating new ride
    When I click the "Offer ride" link on home page
    Then I am on "/rides/new" page
    Then I should see the title "New Ride"
    Then I should see the source
    Then I should see the destination
    Then I should see the price
    Then I should see the date
    Then I should see the seats
    Then I should see the contact
    Then I should see the email

  @javascript
  Scenario: Find ride
    When I click the "Find ride" link on home page
    Then I am on "/rides/find_rides" page
    Then I should see the title "Find a Ride"
    Then I should see the source
    Then I should see the destination
    Then I should see the seats
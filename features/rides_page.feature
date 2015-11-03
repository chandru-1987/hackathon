Feature: Rides page

  Background:
    Given app has basic setup
    And I am authenticated user

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
    When I click the "Offer Ride" link on home page
    Then I am on "/rides/new" page
    Then I should be on the page with title "New ride"
    When I fill in the form with the following
      | ride_source      | fill_in  |Tambaram          |
      | ride_destination | fill_in  |Perumbakkam       |
      | ride_price       | fill_in  |50                |
      | ride_date_1i     | select   |2020              |
      | ride_date_2i     | select   |November          |
      | ride_date_3i     | select   |24                |
      | ride_seats       | fill_in  |2                 |
      | ride_contact     | fill_in  |7894561226        |
      | ride_email       | fill_in  |noreply@gmail.com |
    And I click "Create Ride" button
    Then I should be on ride show page
    Then I should see the "Edit" link
    Then I should see the "Back" link

  @javascript
  Scenario: Find ride
    When I create some new rides
    When I click the "Find Ride" link on home page
    Then I am on "/rides/find_rides" page
    Then I should be on the page with title  "Find a Ride"
    Then I should see the "Back" link
    When I fill in the form with the following
      | search_source      | fill_in  |Tambaram |
      | search_destination | fill_in  |Siruseri |
    And I click "Search" button
    Then I am on the search result page with title "1 Rides found for you"
    Then I should see the "New Ride" link
    Then I should see the "Find Ride" link

Feature: Home page

  Background:
    Given app has basic setup

  @javascript
  Scenario: Viewing application's home page
    When I am on the homepage
    Then I should see the "Welcome to the Bla Bla Bla!!!" message

  @javascript
  Scenario: Logging into the System
    When I am on the homepage
    When I click the "Sign in" link on home page
    Then I am on "/users/sign_in" page
    # Given invalid credentials
    When I enter the "blabla@aspiresys.com" and "aa123"
    When I click the sign in button
    Then I should get "Invalid email or password." notification
    # Given valid credentials
    When I enter the "chandra.thiruvengadam@aspiresys.com" and "aspire@123"
    When I click the sign in button
    Then I should get "Signed in successfully." notification

  @javascript
  Scenario: Create account for new user
    When I am on the homepage
    When I click the "Sign up" link on home page
    Then I am on "/users/sign_up" page
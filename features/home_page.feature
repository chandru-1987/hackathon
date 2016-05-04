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
    When I click the "Sign in" button
    Then I should get "Invalid email or password." notification
    # Given valid credentials
    When I enter the "chandra.mohan@qfor.com" and "qfor@1234"
    When I click the "Sign in" button
    Then I should get "Signed in successfully." notification

  @javascript
  Scenario: Create account for new user
    When I am on the homepage
    When I click the "Sign up" link on home page
    Then I am on "/users/sign_up" page
    When I fill in the form with the following
      | user_name                  | fill_in  |Testing           |
      | user_email                 | fill_in  |testing@gmail.com |
      | user_password              | fill_in  |test@123          |
      | user_password_confirmation | fill_in  |test@123          |
    When I click the "Sign up" button
    Then I should get "Welcome! You have signed up successfully." notification

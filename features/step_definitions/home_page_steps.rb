Given(/^app has basic setup$/) do
  FactoryGirl.create(:user, :name => 'Chandra Mohan T', :email => 'chandra.thiruvengadam@aspiresys.com',
    :password => 'aspire@123', :password_confirmation => 'aspire@123')
end

Given(/^I am authenticated user$/) do
  email = 'chandra.thiruvengadam@aspiresys.com'
  password = 'aspire@123'
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end


When(/^I am on the homepage$/) do
  visit root_path 
end

Then(/^I should see the "(.*?)" message$/) do |msg|
  page.should have_content(msg)
end

When(/^I click the "(.*?)" link on home page$/) do |link_name|
  click_link(link_name)
end

Then(/^I am on "(.*?)" page$/) do |url|
  visit(url)
end

When(/^I enter the "(.*?)" and "(.*?)"$/) do |email, passwd|
  fill_in('user_email', :with => email)
  fill_in('user_password', :with => passwd)
end

When(/^I click the sign in button$/) do
  click_button('Sign in')
end

Then(/^I should get "(.*?)" notification$/) do |msg|
  page.should have_content(msg)
end
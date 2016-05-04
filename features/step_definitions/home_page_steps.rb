Given(/^app has basic setup$/) do
  create_user
end

And(/^I am authenticated user$/) do
  email = 'chandra.mohan@qfor.com'
  password = 'qfor@1234'
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

When(/^I click the "(.*?)" button$/) do |button|
  click_button(button)
end

Then(/^I should get "(.*?)" notification$/) do |msg|
  page.should have_content(msg)
end

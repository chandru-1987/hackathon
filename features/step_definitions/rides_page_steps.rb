Then(/^I should see the no rides in the "(.*?)" table$/) do |table_selector|
  page.should_not have_selector("table#{table_selector}")
end

When(/^I create some new rides$/) do
  FactoryGirl.create(:ride, :source => 'Tambaram', :destination => 'Siruseri', :price => 100, :date => DateTime.now+1,
    :seats => 5, :contact => 123133222, :email => 'sda@gamil.com')
  FactoryGirl.create(:ride, :source => 'Chennai', :destination => 'Trichy', :price => 1000, :date => DateTime.now+7,
    :seats => 2, :contact => 123133222, :email => 'sda@gamil.com')
  end
  
Then(/^I should see the rides in the "(.*?)" table$/) do |table_selector|
  page.should have_content('Listing Rides')
  page.should have_selector("table#{table_selector} tr", :count => 3)
end

Then(/^I should be on the page with title "(.*?)"$/) do |msg|
  page.should have_content(msg)
end

When(/^I fill in the form with the following$/) do |field_action_values|
  field_action_values.raw.each do |field_label, action, value|
    case action
      when 'fill_in'
        fill_in field_label, :with => value
      when 'select'
      select value, :from => field_label
    end
  end
end

When(/^I click "(.*?)" button$/) do |button|
  click_button(button)
end

Then(/^I should be on ride show page$/) do
  visit("/rides/#{Ride.last.id}")
end

Then(/^I should be on the page with title  "(.*?)"$/) do |msg|
  page.should have_content(msg)
end

Then(/^I am on the search result page with title "(.*?)"$/) do |msg|
  page.should have_content(msg)
end

Then(/^I should see the "(.*?)" link$/) do |link_text|
  page.should have_selector('a', :text => link_text)  
end

Then(/^I sleep "(.*?)" seconds$/) do |sec|
  sleep(sec.to_i)
end

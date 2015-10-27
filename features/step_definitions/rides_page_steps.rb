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
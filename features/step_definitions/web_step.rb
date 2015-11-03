

def create_rides
  FactoryGirl.create(:ride, :source => 'Tambaram', :destination => 'Siruseri', :price => 100, :date => DateTime.now+1,
                     :seats => 5, :contact => 123133222, :email => 'sda@gamil.com')
  FactoryGirl.create(:ride, :source => 'Chennai', :destination => 'Trichy', :price => 1000, :date => DateTime.now+7,
                     :seats => 2, :contact => 123133222, :email => 'sda@gamil.com')
end

def create_user
  FactoryGirl.create(:user, :name => 'Chandra Mohan T', :email => 'chandra.thiruvengadam@aspiresys.com',
                     :password => 'aspire@123', :password_confirmation => 'aspire@123')
end

Then(/^I sleep "(.*?)" seconds$/) do |sec|
  sleep(sec.to_i)
end


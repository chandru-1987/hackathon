require 'test_helper'

class RideTest < ActiveSupport::TestCase
  setup do
  	@ride = Ride.new({:source => 'Tambaram', :destination => 'Siruseri', :price => '45', :seats => '5'})
  end
  test 'should not create a ride without source' do
  	@ride.source = ''
		assert @ride.invalid?
  end
  test 'should not create a ride without destination' do
  	@ride.destination = ''
    assert @ride.invalid?
  end
  test 'should not create a ride without price' do
  	@ride.price = ''
    assert @ride.invalid?
  end
  test 'should not create a ride without seats' do
  	@ride.seats = ''
    assert @ride.invalid?
  end
  test 'should create a ride with valid fields' do
    assert @ride.valid?
  end
  test 'Wrong email format' do
  	@ride.email = 'noreply'
    assert @ride.invalid?
  end
  test 'Correct email format' do
    @ride.email = 'noreply@gmail.com'
    assert @ride.valid?
  end
  test 'Invalid source && destination' do
  	@ride.source = '4544545'
    @ride.destination = '4544545'
    assert @ride.invalid?
  end
  test 'Valid source && destination' do
  	@ride.source = 'Tambaram'
    @ride.destination = 'Siruseri'
    assert @ride.valid?
  end
  test 'Invalid price' do
  	@ride.price = 'asdadas'
    assert @ride.invalid?
  end
  test 'Valid price' do
    @ride.price = '100'
    assert @ride.valid?
  end
  test 'Ride date should not be past' do
    @ride.date = DateTime.now - 1
    assert @ride.invalid?
    assert @ride.errors.any?
    assert_equal(["Date can't be in the past"], @ride.errors.full_messages)
  end
  test 'Find rides' do
    rides_pre = Ride.where('date >= ?', DateTime.now)
    rides = rides_pre.source(rides(:one).source)
    rides = rides.destination(rides(:one).destination)
    assert_equal(1, rides.count)
    rides = rides_pre.source(rides(:two).source)
    rides = rides.destination(rides(:two).destination)
    assert_equal(1, rides.count)
    rides = rides_pre.seats(rides(:one).seats)
    assert_equal(2, rides.count)
  end
end

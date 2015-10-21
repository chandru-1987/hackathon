require 'test_helper'

class RidesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:chandra)
    @ride = rides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ride" do
    assert_difference('Ride.count') do
      post :create, ride: { contact: @ride.contact, date: @ride.date, destination: @ride.destination, destination_latitude: @ride.destination_latitude, destination_longitude: @ride.destination_longitude, email: @ride.email, price: @ride.price, seats: @ride.seats, source: @ride.source, source_latitude: @ride.source_latitude, source_longitude: @ride.source_longitude }
    end

    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should show ride" do
    get :show, id: @ride
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ride
    assert_response :success
  end

  test "should update ride" do
    put :update, id: @ride, ride: { contact: @ride.contact, date: @ride.date, destination: @ride.destination, destination_latitude: @ride.destination_latitude, destination_longitude: @ride.destination_longitude, email: @ride.email, price: @ride.price, seats: @ride.seats, source: @ride.source, source_latitude: @ride.source_latitude, source_longitude: @ride.source_longitude }
    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should get rides based on search parameters" do
    get :find_rides
		assert_response :success
    get :find_rides, :search => {:source => 'Tambaram', :destination => 'Siruseri', :seats => 5}
		assert_response :success
    assert_equal(1, assigns(:rides).count)
		get :find_rides, :search => {:source => '', :destination => '', :seats => ''}
    assert_response :success
    assert_equal(2, assigns(:rides).count)
    get :find_rides, :search => {:source => '', :destination => '', :seats => 6}
    assert_response :success
    assert_equal(0, assigns(:rides).count)
  end

  test "should destroy ride" do
    assert_difference('Ride.count', -1) do
      delete :destroy, id: @ride
    end

    assert_redirected_to rides_path
  end
end

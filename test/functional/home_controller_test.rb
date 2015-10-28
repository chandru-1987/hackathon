require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "after user login" do
    sign_in users(:chandra)	
    get :index
    assert_select('ul', :attributes => {:class => 'nav navbar-nav'}) do
      assert_select('a', :text => 'Edit account', :href => '/users/edit')
      assert_select('a', :text => 'Rides', :href => '/rides')
      assert_select('a', :text => 'Offer Ride', :href => '/rides/new')
      assert_select('a', :text => 'Find Ride', :href => '/rides/find_rides')
      assert_select('a', :text => 'Sign out', :href => '/users/sign_out')
    end
  end

  test "after user logout" do
    sign_out users(:chandra)
		get :index
    assert_select('ul', :attributes => {:class => 'nav navbar-nav'}) do
      assert_select('a', :text => 'Sign in', :href => '/users/sign_in')
      assert_select('a', :text => 'Sign up', :href => '/users/sign_up')
    end
  end

end

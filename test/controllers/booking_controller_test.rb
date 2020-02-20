require 'test_helper'

class BookingControllerTest < ActionDispatch::IntegrationTest
  test "should get booking" do
    get booking_booking_url
    assert_response :success
  end

end

require 'rails_helper'

describe "Booking" do
  it "should not create booking for zero distance" do
    booking = Booking.new(is_active: true, distance_in_meters: 0)
    expect(booking).to_not be_valid
  end
end

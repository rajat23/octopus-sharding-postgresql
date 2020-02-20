class UpdateBookingStatusWorker
  include Sidekiq::Worker

  def perform(booking_id)
   puts "found booking id" << String(booking_id)
   @booking = Booking.find(booking_id)
   puts "found booking" << @booking.distance_in_meters
  end
end

class UpdateBookingStatusWorker
  include Sidekiq::Worker

  def perform(booking_id)
   @booking = Booking.find(booking_id)
   @booking.update(status: 'processed')
  end
end

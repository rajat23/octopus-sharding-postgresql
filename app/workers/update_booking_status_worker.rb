class UpdateBookingStatusWorker
  include Sidekiq::Worker

  def perform(customer_id, booking_id)
   if(customer_id.to_i % 2 == 0)
     @booking = Booking.using(:old).find(booking_id)
     @booking.using(:old).update(status: 'processed')
   else
     @booking = Booking.using(:new).find(booking_id)
     @booking.using(:new).update(status: 'processed')
   end
  end
end

class ApplicationController < ActionController::Base
end

class BookingController < ApplicationController
  # GET method to get a booking by id
    def show
      if(params[:id].to_i % 2 == 0)
        @booking = Booking.using(:old).where(customer_id: params[:id]).take!
      else
        @booking = Booking.using(:new).where(customer_id: params[:id]).take!
      end
      render json: { booking: @booking.as_json }, status: :ok
    end

  # POST
    def create
      if(booking_params[:customer_id].to_i % 2==0)
        @booking = Booking.using(:old).create(booking_params)
        puts "inside old"
        @booking.save!
      else
        @booking = Booking.using(:new).create(booking_params)
        puts "inside new"
        @booking.save!
      end
      UpdateBookingStatusWorker.perform_async(@booking.customer_id, @booking.id)
    end

    def booking_params
        params.require(:booking).permit(:customer_id, :is_active, :distance_in_meters)
    end
end
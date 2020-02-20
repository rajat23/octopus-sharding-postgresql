class ApplicationController < ActionController::Base
end

class BookingController < ApplicationController
  # GET method to get a booking by id
    def show
      @booking = Booking.find(params[:id])
      render json: { booking: @booking.as_json }, status: :ok
    end

  # POST
    def create
      @booking = Booking.create(booking_params)
      @booking.save!
    end

    def booking_params
        params.require(:booking).permit(:is_active, :distance_in_meters)
    end
end
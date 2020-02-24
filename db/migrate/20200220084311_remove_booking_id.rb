class RemoveBookingId < ActiveRecord::Migration[5.2]
  using(:old, :new)
  def change
    remove_column :bookings, :booking_id
  end
end

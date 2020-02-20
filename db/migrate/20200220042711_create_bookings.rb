class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.bigint :booking_id
      t.boolean :is_active
      t.float :distance_in_meters

      t.timestamps
    end
  end
end

class AddCustomerId < ActiveRecord::Migration[5.2]
  using(:old, :new)
  def change
    add_column :bookings, :customer_id, :int
  end
end

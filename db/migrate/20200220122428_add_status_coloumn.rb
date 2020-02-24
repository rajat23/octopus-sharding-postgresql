class AddStatusColoumn < ActiveRecord::Migration[5.2]
  using(:old, :new)
  def change
   add_column :bookings, :status, :string
  end
end

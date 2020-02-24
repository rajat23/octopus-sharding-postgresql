class Booking < ActiveRecord::Base
#     octopus_establish_connection(:adapter => "postgresql", :database => "transport_dev")
    validates :distance_in_meters, numericality: { greater_than: 0 }
end

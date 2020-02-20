class Booking < ActiveRecord::Base
    validates :distance_in_meters, numericality: { greater_than: 0 }
end

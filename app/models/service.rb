class Service < ApplicationRecord
    has_many :bookings, dependent: :destroy
  
    validates :name, presence: true
    validates :description, presence: true
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

    def available_at?(time)
        bookings.where(booking_time: time).none?
      end
  end
  
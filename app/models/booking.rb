class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :booking_time, presence: true
end

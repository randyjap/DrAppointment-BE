class TimeSlot < ApplicationRecord
  validates :appointment_date, :time, presence: true

  belongs_to :appointment_date
  has_many :appointments
end

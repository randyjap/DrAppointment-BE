class AppointmentDate < ApplicationRecord
  validates :appointment_date, presence: true

  has_many :time_slots
end

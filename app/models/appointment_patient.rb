class AppointmentPatient < ApplicationRecord
  validates :appointment, :patient, presence: true

  belongs_to :appointment
  belongs_to :patient
end

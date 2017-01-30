class Doctor < ApplicationRecord
  validates :salutation, :first_name, :last_name, :street,
            :street_number, :city, :lat, :lng, presence: true

  has_many :appointments
  has_many :appointment_patients, through: :appointments
  has_many :patients, through: :appointment_patients
end

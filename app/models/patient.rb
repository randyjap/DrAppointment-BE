class Patient < ApplicationRecord
  validates :first_name, :last_name, :user, presence: true

  belongs_to :user
  has_many :appointment_patients
  has_many :appointments, through: :appointment_patients
  has_many :doctors, through: :appointments
end

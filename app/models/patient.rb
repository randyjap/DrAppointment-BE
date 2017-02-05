class Patient < ApplicationRecord
  validates :first_name, :last_name, :user, presence: true

  belongs_to :user
  has_many :appointment_patients
  has_many :appointments, through: :appointment_patients
  has_many :doctors, through: :appointments

  validate :unique_to_user

  def unique_to_user
    duplicate = self.user.patients.any? do |patient|
      patient.first_name == self.first_name &&
      patient.last_name == self.last_name
    end

    errors.add(:patient, "has already been created") if duplicate
  end
end

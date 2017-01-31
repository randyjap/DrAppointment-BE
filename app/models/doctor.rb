class Doctor < ApplicationRecord
  validates :salutation, :first_name, :last_name, :street,
            :street_number, :zip_code, :city, :state, :image_url, :phone_number, :lat, :lng, presence: true

  validates :phone_number, length: { is: 10, :message => "%{value} is not correct length" }

  validate :phone_all_numerical?

  has_many :appointments
  has_many :appointment_patients, through: :appointments
  has_many :patients, through: :appointment_patients
  has_many :blocked_times

  def timeslots(date)
    AppointmentDate.find_by(appointment_date: date).time_slots.sort
  end

  private

  def phone_all_numerical?
    errors.add(:phone_number, 'must be numerical') unless self.phone_number == self.phone_number.gsub(/[^\d]/, '')
  end
end

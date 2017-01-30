class Appointment < ApplicationRecord
  validates :doctor, :time_slot, :user, presence: :true
  validate :blocked?, :overlap?, :in_the_future?

  belongs_to :doctor
  belongs_to :time_slot
  belongs_to :user

  has_many :appointment_patients
  has_many :patients, through: :appointment_patients

  private

  def blocks
    BlockedTime
      .where(doctor: self.doctor)
      .where(time_slot: self.time_slot)
  end

  def find_overlap
    Appointment
      .where.not(id: self.id)
      .where(doctor: self.doctor)
      .where(time_slot: self.time_slot)
  end

  def blocked?
    errors.add(:appointment, "is blocked by doctor") unless blocks.empty?
  end

  def overlap?
    errors.add(:appointment, "of another overlaps yours") unless find_overlap.empty?
  end

  def in_the_future?
    errors.add(:appointment, "must be in the future") if time_slot.appointment_date.appointment_date > Date.today
  end
end

class Appointment < ApplicationRecord
  validates :doctor, :time_slot, :user, presence: :true
  validate :blocked?, :overlap?, :in_the_future?

  belongs_to :doctor
  belongs_to :time_slot
  belongs_to :user

  has_many :appointment_patients
  has_many :patients, through: :appointment_patients

  after_create :reminder

  @@REMINDER_TIME = 1.hours

  def reminder
    account_sid = ENV["twilio_account_sid"]
    auth_token = ENV["twilio_auth_token"]
    to = "1 #{self.user.phone_number}"
    from = ENV["twilio_phone_number"]
    time = self.time_slot.time[0..1].to_i < 12 ? "#{self.time_slot.time} am" : self.time_slot.time
    doctor_name = "#{doctor.salutation} #{doctor.first_name} #{doctor.last_name}"
    patient_names = patients.map { |patient| "#{patient.first_name} #{patient.last_name}" }.join(" and ")
    notes = self.notes.nil? ? "" :
    "\n\nYou left the following notes:\n\n#{self.notes}"
    message = "Hello,\nthis is a kind reminder for your appointment for #{patient_names} at #{time} on #{self.time_slot.appointment_date.appointment_date} with #{doctor_name} #{notes}"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    sms = @client.account.messages.create({
        :to => to,
        :from => from,
        :body => message
    })
    puts sms.to
  end

  def time
    date = self.time_slot.appointment_date.appointment_date
    time = self.time_slot.time
    DateTime.new(date.year, date.month, date.day, time[0..1].to_i, time[-2..-1].to_i, 0, '-8')
  end

  def when_to_run
    self.time - @@REMINDER_TIME
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }

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
    errors.add(:appointment, "must be in the future") if time_slot.appointment_date.appointment_date < Date.today
  end
end

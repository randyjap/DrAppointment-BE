class User < ApplicationRecord
  validates :first_name, :last_name, :phone_number, :country_code, :authy_id,
    :session_token, :status, presence: true

  validates :status, :inclusion => { :in => %w(pending authenticated disabled),
    :message => "%{value} is not a valid status" }

  after_initialize :ensure_session_token, :default_status, :generate_authy

  has_many :appointments
  has_many :favorites
  has_many :patients
  has_many :doctors, through: :appointments
  has_many :favorite_doctors, through: :favorites, source: :doctor

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private

  def default_status
    self.status ||= "pending"
  end

  def generate_authy
    self.authy_id ||= rand(100000..999999)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end

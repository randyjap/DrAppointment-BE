class Favorite < ApplicationRecord
  validates :doctor, :user, presence: true

  belongs_to :user
  belongs_to :doctor
end

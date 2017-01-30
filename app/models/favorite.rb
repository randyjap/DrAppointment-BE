class Favorite < ApplicationRecord
  validates :doctor, :user, presence: true

  belongs_to :User
  belongs_to :Doctor
end

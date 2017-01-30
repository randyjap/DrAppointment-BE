class BlockedTime < ApplicationRecord
  validates :doctor, :time_slot, presence: true

  belongs_to :doctor
  belongs_to :time_slot
end

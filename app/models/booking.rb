class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :desk

  validates :date, presence: true
end

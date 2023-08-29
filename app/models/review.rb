class Review < ApplicationRecord
  belongs_to :appointment
  validates :comment, presence: true
  validates :comment, length: { minimum: 6 }
  validates :comment, length: { maximum: 250 }
  validates :rating, presence: true
end

class Procedure < ApplicationRecord
  belongs_to :doctor
  has_many :appointments
  validates :name, presence: true
  validates :price, presence: true
  validates :duration, presence: true
end

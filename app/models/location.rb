class Location < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
  validates :name, presence: true
  validates :address, presence: true
end

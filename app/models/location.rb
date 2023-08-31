class Location < ApplicationRecord
  has_many :doctors_locations, dependent: :destroy
  has_many :users, through: :doctors_locations
  validates :name, presence: true
  validates :address, presence: true
end
